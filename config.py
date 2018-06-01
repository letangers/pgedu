import os

basedir=os.path.abspath(os.path.dirname(__file__))

class Config:
    @staticmethod
    def init_app(app):
        pass

    SECRET_KEY='a string'
    SQLALCHEMY_COMMMIT_ON_TEARDOWN=True
    SQLALCHEMY_DATABASE_URI='mysql+pymysql://root:password@127.0.0.1:3306/pgedu'
    SQLALCHEMY_TRACK_MODIFICATIONS=True

class DevelopmentConfig(Config):
    DEBUG=True

class ProductionConfig(Config):
    DEBUG=False

config={
    'development':DevelopmentConfig,
    'production':ProductionConfig
}
