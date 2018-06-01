from flask_wtf import FlaskForm
from wtforms import StringField,PasswordField,SubmitField
from wtforms.validators import Required,Length,Email,Regexp,EqualTo
from wtforms import ValidationError


class RegisterForm(FlaskForm):
    phone=StringField('手机号',validators=[Required(),Length(11)])
    name=StringField('真实姓名',validators=[Required(),Length(1,64)])
    password=PasswordField('密码',validators=[Required(),Length(6,64),EqualTo('confirm',message='两次输入必须一致')])
    confirm=PasswordField('重复密码',validators=[Required(),Length(6,64)])
    submit=SubmitField('注  册')

class LoginForm(FlaskForm):
    phone=StringField('手机号',validators=[Required(),Length(11)])
    password=PasswordField('密码',validators=[Required(),Length(1,64)])
    submit=SubmitField('登  录')
