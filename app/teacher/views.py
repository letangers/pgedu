from . import teacher
from flask import render_template,redirect,request
from flask_login import login_required
from ..decorators import current_user,permission_required
from ..models import Permission,db,Achievement,Verify,Course
import os
from .. import basedir
from werkzeug.utils import secure_filename

upload=os.path.join(basedir,'static/achievement')

@teacher.route('/user_center/',methods=['GET','POST'])
@login_required
@permission_required(Permission.teacher)
def user_center():
    infomation="用户中心"
    return render_template('teacher/user_center.html',infomation=infomation)

@teacher.route('/base_info/',methods=['GET','POST'])
@login_required
@permission_required(Permission.teacher)
def base_info():
    infomation="基本信息"
    if request.method=='POST':
        if current_user.state:
            if request.form['sex']=='男':
                current_user.sex=True
            else:
                current_user.sex=False
            current_user.name=request.form['name']
            current_user.grade=request.form['grade']
            current_user.major=request.form['major']
            current_user.age=request.form['age']
            current_user.free_time=request.form['free_time']
            db.session.add(current_user)
            db.session.commit()
        else:
            verify=Verify.query.filter(Verify.teacher_id==current_user.id).first()
            if not verify:
                verify=Verify()
            verify.teacher_id=current_user.id
            verify.reason="暂未审核"
            photo=request.files['src']
            path=os.path.join(basedir,'static/verify',secure_filename(photo.filename))
            verify.src='/static/verify/'+secure_filename(photo.filename)
            photo.save(path)
            db.session.add(verify)
            db.session.commit()
    verify=Verify.query.filter(Verify.teacher_id==current_user.id).first() 
    return render_template('teacher/base_info.html',infomation=infomation,verify=verify)

@teacher.route('/study_achievement/',methods=['GET','POST'])
@login_required
@permission_required(Permission.teacher)
def study_achievement():
    infomation="学习成果"
    if request.method=='POST':
        if "id" in request.form:
            achievement=Achievement.query.get(request.form['id'])
            db.session.delete(achievement)
            db.session.commit()
        else:
            achievement=Achievement()
            achievement.name=request.form['name']
            photo=request.files['src']
            path=os.path.join(upload,str(current_user.id))
            if not os.path.exists(path):
                os.mkdir(path)
            upload_path=os.path.join(path,secure_filename(photo.filename))
            achievement.src='/static/achievement/'+str(current_user.id)+'/'+secure_filename(photo.filename)
            if os.path.exists(upload_path):
                upload_path=os.path.join(path,secure_filename(photo.filename)+str(len(os.listdir(path))))
                achievement.src='/static/achievement/'+str(current_user.id)+'/'+secure_filename(photo.filename)+str(len(os.listdir(path)))
            photo.save(upload_path)
            
            achievement.teacher_id=current_user.id
            db.session.add(achievement)
            db.session.commit()
    achievements=Achievement.query.filter(Achievement.teacher_id==current_user.id)
    return render_template('teacher/study_achievement.html',infomation=infomation,achievements=achievements)

@teacher.route('/teach_experience/',methods=['GET','POST'])
@login_required
@permission_required(Permission.teacher)
def teach_experience():
    infomation="教学经历"
    return render_template('teacher/teach_experience.html',infomation=infomation)

@teacher.route('/change_password/',methods=['GET','POST'])
@login_required
@permission_required(Permission.teacher)
def change_password():
    infomation='修改密码'
    error=""
    if request.method=='POST':
        if current_user.verify_password(request.form['oldpassword']):
            current_user.password=request.form['password']
            db.session.add(current_user)
            db.session.commit()
            error="修改成功"
        else:
            error='密码错误'
    return render_template('teacher/change_password.html',infomation=infomation,error=error)

@teacher.route('/release_course/',methods=['GET','POST'])
def release_course():
    infomation='发布课程'
    error=""
    if request.method=='POST':
        course=Course()
        course.grade=request.form['grade']
        course.name=request.form['name']
        course.teacher_id=current_user.id
        db.session.add(course)
        db.session.commit()
    courses=Course.query.filter(Course.teacher_id==current_user.id).all()
    return render_template('teacher/release_course.html',error=error,infomation=infomation,courses=courses)

@teacher.route('/all_order/',methods=['GET','POST'])
def all_order():
    infomation='全部订单'
    return render_template('teacher/all_order.html',infomation=infomation)

@teacher.route('/unconfirmed_order/',methods=['GET','POST'])
def unconfirmed_order():
    infomation='已确认的订单'
    return render_template('teacher/unconfirmed_order.html',infomation=infomation)

@teacher.route('/confirmed_order/',methods=['GET','POST'])
def confirmed_order():
    infomation='待确认的订单'
    return render_template('teacher/confirmed_order.html',infomation=infomation)

