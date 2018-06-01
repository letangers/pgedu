from flask import Blueprint
from ..models import Permission

auth=Blueprint('auth',__name__)

@auth.app_context_processor
def inject_permission():
    return dict(permission=Permission)

from . import views
