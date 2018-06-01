from . import auth
from .forms import LoginForm,RegisterForm
from flask import render_template,redirect,url_for,request
from flask_login import login_user,logout_user
from ..models import User,db,Permission,Role

@auth.route('/select_role/',methods=['GET','POST'])
def select_role():
    return render_template('auth/select_role.html')

@auth.route('/teacher_login/',methods=['GET','POST'])
def teacher_login():
    login=LoginForm()
    error=""
    if login.validate_on_submit():
        teacher=User.query.filter_by(phone=request.form['phone']).first()
        if teacher is None:
            error="该手机号未注册教师账户"
        elif teacher.permission==Permission.student:
            error="该手机号为学生帐号"
        elif not teacher.verify_password(request.form['password']):
            error="密码错误"
        else:
            login_user(teacher,True)
            return redirect(url_for('teacher.user_center'))
    return render_template('auth/teacher_login.html',error=error,login=login)

@auth.route('/teacher_register/',methods=['GET','POST'])
def teacher_register():
    register=RegisterForm()
    error="" 
    if register.validate_on_submit():
        teacher=User.query.filter_by(phone=request.form['phone']).first()
        if teacher is None:
            teacher=User()
            teacher.permission=Permission.teacher
            #teacher.role=Role.query.filter_by(name='teacher').first()
            teacher.phone=request.form['phone']
            teacher.name=request.form['name']
            teacher.password=request.form['password']
            db.session.add(teacher)
            db.session.commit()
            return redirect(url_for('auth.teacher_login'))
        else:
            error="该手机号已经被注册"
    return render_template('auth/teacher_register.html',error=error,register=register)

@auth.route('/student_login/',methods=['GET','POST'])
def student_login():
    login=LoginForm()
    error=""
    if login.validate_on_submit():
        student=User.query.filter_by(phone=request.form['phone']).first()
        print(student.verify_password(request.form['password']))
        if student is  None:
            error="该手机号未注册学生帐号"
        elif student.permission==Permission.teacher:
            error='该手机号为教师帐号'
        elif not student.verify_password(request.form['password']):
            error="密码错误"
        else:
            login_user(student,True)
            return redirect(url_for('student.user_center'))
    return render_template('auth/student_login.html',error=error,login=login)

@auth.route('/student_register/',methods=['GET','POST'])
def student_register():
    register=RegisterForm()
    error=""
    if register.validate_on_submit():
        student=User.query.filter_by(phone=request.form['phone']).first()
        if student is None:
            student=User()
            student.permission=Permission.student
            #student.role=Role.query.filter_by(name='student').first()
            student.state=True
            student.phone=request.form['phone']
            student.name=request.form['name']
            student.password=request.form['password']
            db.session.add(student)
            db.session.commit()
            return redirect(url_for('auth.student_login'))
        else:
            error="该手机号已经被注册"
    return render_template('auth/student_register.html',error=error,register=register)

@auth.route('/admin/login/',methods=['POST','GET'])
def admin_login():
    if request.method=='POST':
        pass

@auth.route('/logout/')
def logout():
    logout_user()
    return redirect(url_for('main.index'))
