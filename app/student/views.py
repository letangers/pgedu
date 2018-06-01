from flask import render_template,redirect,request,flash,url_for
from ..decorators import current_user,permission_required
from ..models import db,Permission,Order
from . import student
from flask_login import login_required
@student.route('/user_center/',methods=['GET','POST'])
@login_required
@permission_required(Permission.student)
def user_center():
    infomation="用户中心"
    return render_template('student/user_center.html',infomation=infomation)
'''
@student.route('/base_info/',methods=['GET','POST'])
def base_info():
    infomation="基本信息"
    return render_template('student/base_info.html',infomation=infomation)
'''
@student.route('/student_info/',methods=['GET','POST'])
@login_required
@permission_required(Permission.student)
def student_info():
    infomation="学生信息"
    if request.method=='POST':
        current_user.name=request.form['name']
        if request.form['sex']=='男':
            current_user.sex=True
        else:
            current_user.sex=False
        current_user.grade=request.form['grade']
        current_user.introduction=request.form['introduction']
        current_user.address=request.form['address']
        current_user.age=request.form['age']
        db.session.add(current_user)
        db.session.commit()
    return render_template('student/student_info.html',infomation=infomation)

@student.route('/change_password/',methods=['GET','POST'])
@login_required
@permission_required(Permission.student)
def change_password():
    infomation="修改密码"
    error=""
    if request.method=='POST':
        if current_user.verify_password(request.form['oldpassword']):
            current_user.password=request.form['password']
            db.session.add(current_user)
            db.session.commit()
            error="密码修改成功"
        else:
            error="密码错误"
    return render_template('student/change_password.html',infomation=infomation,error=error)

@student.route('/order_teacher/',methods=['GET','POST'])
@login_required
@permission_required(Permission.student)
def order_teacher():
    infomation="预约家教"
    return redirect(url_for("main.search"))
        #return render_template('student/create_order.html',infomation=infomation)

@student.route('/all_order/',methods=['GET','POST'])
def all_order():
    infomation="全部订单"
    temp=Order.query.filter(Order.student_id==current_user.id)
    pagination=temp.order_by(Order.id.desc()).paginate(1,10,error_out=False)
    orders=pagination.items
    return render_template('student/all_order.html',orders=orders,infomation=infomation,pagination=pagination)

@student.route('/unconfirmed_order/',methods=['GET','POST'])
def unconfirmed_order():
    temp=Order.query.filter(Order.status=='未同意').filter(Order.student_id==current_user.id)
    pagination=temp.order_by(Order.id.desc()).paginate(1,10,error_out=False)
    orders=pagination.items
    infomation="待确认的订单"
    return render_template('student/unconfirmed_order.html',orders=orders,infomation=infomation,pagination=pagination)

@student.route('/confirmed_order/',methods=['GET','POST'])
def confirmed_order():
    temp=Order.query.filter(Order.status=='已同意').filter(Order.student_id==current_user.id)
    pagination=temp.order_by(Order.id.desc()).paginate(1,10,error_out=False)
    orders=pagination.items
    infomation="已确认的订单"
    return render_template('student/confirmed_order.html',orders=orders,infomation=infomation,pagination=pagination)

@student.route('/order_detail/',methods=['GET','POST'])
def order_detail():
    infomation="订单详情"
    return render_template('student/order_detail.html',infomation=infomation)

