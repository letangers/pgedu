from . import admin
from flask import render_template,request,redirect,url_for
from flask_login import login_user,logout_user
from ..models import db,Permission,User,Verify
from ..decorators import permission_required

@admin.route('/',methods=['GET','POST'])
@permission_required(Permission.admin)
def index():
    return render_template('admin/admin.html')

@admin.route('/login/',methods=['GET','POST'])
def login():
    error=""
    if request.method=='POST':
        ad=User.query.filter_by(phone=request.form['phone']).first()
        if ad is None:
            error="unknown phone number"
        elif not ad.permission==Permission.admin:
            error="you have no permission!!!"
        elif not ad.verify_password(request.form['password']):
            error="密码错误"
        else:
            login_user(ad,True)
            return redirect(url_for('admin.index'))
    return render_template('admin/admin_login.html',error=error)

@admin.route('/logout/')
def logout():
    logout_user()
    return redirect(url_for('admin.login'))

@admin.route('/waitParent/',methods=['GET','POST'])
def wait_parent():
    return render_template('admin/waitingValidateParents.html')

@admin.route('/verify_teacher/',methods=['GET','POST'])
@permission_required(Permission.admin)
def verify_teacher():
    if request.method=='POST':
        verify=Verify.query.get(request.form['id'])
        verify.reason=request.form['reason'] 
        db.session.add(verify)
        db.session.commit()
    verify=request.args.get('verify')
    if verify=='yes':
        verify=Verify.query.get(request.args.get('id'))
        teacher=User.query.get(verify.teacher_id)
        teacher.state=True
        db.session.delete(verify)
        db.session.add(teacher)
        db.session.commit()
    verifys=Verify.query.all()
    return render_template('admin/verify_teacher.html',verifys=verifys)

