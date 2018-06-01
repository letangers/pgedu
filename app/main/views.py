from . import main
from flask import render_template,url_for,redirect,request
from flask_login import login_required
from ..models import db,Course,User,Achievement


@main.route('/',methods=['GET','POST'])
def index():
    courses=db.session.query(Course.grade,Course.name).distinct().all()
    return render_template('main/index.html',courses=courses)

@main.route('/search/',methods=['GET','POST'])
@login_required
def search():
    if request.method=='POST':
        temp=Course.query.filter(request.form['course'] in Course.name)
    else:
        grade=request.args.get('grade')
        course=request.args.get('course')
        page=request.args.get('page')
        sex=request.args.get('sex')
        temp=Course.query
        if grade is not None:
            temp=temp.filter(Course.grade==grade)
        if course is not None:
            temp=temp.filter(Course.name==course)
        if sex is not None:
            if sex=='男':
                temp=temp.filter(User.sex==True)
            else:
                temp=temp.filter(User.sex==False)
    pagination=temp.order_by(Course.id.desc()).paginate(1,10,error_out=False)
    #pagination=Course.query.join(User,User.id==Course.teacher_id).filter(Course.grade==grade,Course.name==course).order_by(Course.id.desc()).paginate(1,10,error_out=False)
    courses=pagination.items
    return render_template('main/search.html',pagination=pagination,courses=courses)

@main.route('/course_detail/',methods=['GET','POST'])
def course_detail():
    course_id=request.args.get('course_id')
    course=Course.query.filter(Course.id==course_id).first()
    achievements=Achievement.query.filter(Achievement.teacher_id==course.teacher.id).all()

    return render_template('main/course_detail.html',course=course,achievements=achievements)

@main.route('/activateFail/',methods=['GET','POST'])
def activate_fail():
    return render_template('main/activateFail.html')

@main.route('/activateRemind/',methods=['GET','POST'])
def activate_remind():
    return render_template('main/activateRemind.html')

@main.route('/activateSuccess/',methods=['GET','POST'])
def activate_success():
    return render_template('main/activateSuccess.html')

