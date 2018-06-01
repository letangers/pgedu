import os
from flask import Flask
from flask_bootstrap import Bootstrap
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

from config import config

basedir=os.path.dirname(__file__)

bootstrap=Bootstrap()
db=SQLAlchemy()
login_manager=LoginManager()
login_manager.session_protection='strong'
login_manager.login_view='auth.student_login'

def create_app(config_name):
    from .auth import auth as auth_blueprint
    from .main import main as main_blueprint
    from .admin import admin as admin_blueprint
    from .student import student as student_blueprint
    from .teacher import teacher as teacher_blueprint
    app=Flask(__name__)
    app.register_blueprint(main_blueprint)
    app.register_blueprint(admin_blueprint,url_prefix="/admin")
    app.register_blueprint(auth_blueprint)
    app.register_blueprint(student_blueprint,url_prefix="/student")
    app.register_blueprint(teacher_blueprint,url_prefix="/teacher")
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)
    login_manager.init_app(app)
    bootstrap.init_app(app)
    db.init_app(app)
    return app
