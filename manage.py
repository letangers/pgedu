#!/usr/bin/env python3
import os
from app import create_app,db
from app.models import User,Order,Achievement,Course,Role,Permission,Verify
from flask_script import Manager,Shell

def make_shell_context():
    return dict(app=app,db=db,role=Role,user=User,course=Course,order=Order,verify=Verify,achievement=Achievement,permission=Permission)

if __name__=='__main__':
    app=create_app('development')
    manager=Manager(app)
    manager.add_command('shell',Shell(make_context=make_shell_context))
    ctx=app.app_context()
    ctx.push()
    manager.run()
