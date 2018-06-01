from . import login_manager,db
from flask_login import UserMixin,AnonymousUserMixin
from werkzeug.security import generate_password_hash,check_password_hash
from datetime import datetime

class Permission:
    admin=0x80
    teacher=0x40
    student=0x20
    verify_teacher=0x10
    verify_order=0x08
    create_course=0x04
    create_order=0x02
    change_info=0x01


class Role(db.Model):
    __tablename__='role'
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(64),unique=True)
    default=db.Column(db.Boolean,default=False)
    permission=db.Column(db.Integer,index=True)
    user=db.relationship('User',backref='role')
    @staticmethod
    def insert_roles():
        roles={
            'student':(Permission.student,True),
            'teacher':(Permission.teacher,False),
            'admin':(Permission.admin,False)
        }
        for r in roles:
            role=Role.query.filter_by(name=r).first()
            if role is None:
                role=Role(name=r)
            role.permission=roles[r][0]
            role.default=roles[r][1]
            db.session.add(role)
            db.session.commit()


class AnonymousUser(AnonymousUserMixin):
    def can(self,permission):
        return False
    def is_admin(self):
        return False

login_manager.anonymous_user=AnonymousUser

@login_manager.user_loader
def load_user(id):
    return User.query.filter_by(id=id).first()

class User(db.Model,UserMixin):
    __tablename__='user'
    id=db.Column(db.Integer,primary_key=True,index=True)
    name=db.Column(db.String(10),index=True)
    phone=db.Column(db.String(11),index=True)
    @property
    def password(self):
        raise AttributeError('password is not a readable attribute')
 
    password_hash=db.Column(db.String(128),nullable=False)

    @password.setter
    def password(self,password):
        self.password_hash=generate_password_hash(password)
    
    def verify_password(self,password):
        return check_password_hash(self.password_hash,password)

    sex=db.Column(db.Boolean)
    introduction=db.Column(db.String(512),default='这家伙很懒，什么都没写...')
    state=db.Column(db.Boolean,default=False)#教师的属性，true表示已通过认证
    #state=db.Column(db.Enum("已上传","已通过","未上传"),default="未上传")
    age=db.Column(db.SmallInteger)
    grade=db.Column(db.String(64))
    major=db.Column(db.String(64))
    address=db.Column(db.String(128))
    order=db.relationship('Order',backref='user')
    achievement=db.relationship('Achievement',backref='teacher')
    permission=db.Column(db.Integer,db.ForeignKey('role.permission'))

    def can(self,permission):
        return self.permission is not None and self.permission==permission

    balance=db.Column(db.Integer,default=0)
    free_time=db.Column(db.String(128))

class Achievement(db.Model):
    __tablename__='achievement'
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(64))
    src=db.Column(db.String(64))
    teacher_id=db.Column(db.Integer,db.ForeignKey('user.id'))

class Course(db.Model):
    __tablename__='course'
    id=db.Column(db.Integer,primary_key=True,index=True)
    grade=db.Column(db.Enum("小学","初中","高中","兴趣"),index=True)
    name=db.Column(db.String(10),index=True)
    price=db.Column(db.Integer)
    teacher_id=db.Column(db.Integer,db.ForeignKey('user.id'))
    teacher=db.relationship('User',backref='course')
    order=db.relationship('Order',backref='course')   
 
class Order(db.Model):
    __tablename__='order'
    id=db.Column(db.Integer,primary_key=True)
    phone=db.Column(db.String(11))
    student_id=db.Column(db.Integer,db.ForeignKey('user.id'))
    course_id=db.Column(db.Integer,db.ForeignKey('course.id'))
    address=db.Column(db.String(128),nullable=False)
    create_time=db.Column(db.DateTime,index=True,default=datetime.utcnow())
    status=db.Column(db.Enum('已取消','未付款','未同意','已同意','已完成'),default='未付款')
    comment=db.Column(db.String(512),default='该学生未对本次教学作出评价')


'''
Teacher_Course=db.Table('teacher_course',
    db.Column('teacher_id',db.Integer,db.ForeignKey('user.id')),
    db.Column('course_id',db.Integer,db.ForeignKey('course.id'))
)
'''

class Verify(db.Model):
    id=db.Column(db.Integer,primary_key=True,index=True)
    teacher_id=db.Column(db.Integer,db.ForeignKey('user.id'))
    src=db.Column(db.String(64))
    reason=db.Column(db.String(64),default="暂未审核")
    teacher=db.relationship('User',backref='verify')
