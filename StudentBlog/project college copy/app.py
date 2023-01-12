#All these libraries need to be installed on the system using the package manager, PIP on CMD. 
from flask import Flask, render_template, flash, redirect, url_for, session, logging, request
#This is imported from the data.py in the same folder where firstpro.py exists.
#from data import posts
#MYSQL packages that operate with MySQL Database
from flask_mysqldb import MySQL, MySQLdb
#wtforms are built in forms that need to be installed on our system using pip and fileds need to included

from wtforms import Form, StringField, TextAreaField,PasswordField, validators, HiddenField
#passlib.hash is used for encrypting our password we want to use. 
from passlib.hash import sha256_crypt

import mysql.connector
#used for styling, are called as decorators as well

from wtforms.fields import DateField, EmailField, TelField
#Sometimes, the versio of wtform will be different
import os
#This is instance of flask, that accepts __name__ as a parameter
from functools import wraps
#we extract the decorators method from the wrap class for puttuing
#some constraints for the pages. 
from werkzeug.utils import secure_filename
from werkzeug.datastructures import  FileStorage

app = Flask(__name__)
app.secret_key = os.urandom(24)
#Secret key is used for the security purposes

#MySQL Configuration Codes
mysql = MySQL()
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'college'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

#Initialize the app for use with this MySQL class
mysql.init_app(app)

def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, *kwargs)
        else:
            flash('Unauthorized, please login', 'danger')
            return redirect(url_for('login'))
    return wrap
 
def not_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            flash('you are already logged_in', 'danger')
            return redirect('register')
        else:
            return f(*args, *kwargs)
    return wrap
#Homepge route (a path to homepage)
@app.route('/')
def home():
    return render_template('home.html')

@app.route('/about')
def about():
    return render_template('about.html')


@app.route('/thanks')
def thansk():
    return render_template('thanks.html')


@app.route('/teachers')
def teachers():
    return render_template('teachers.html')

@app.route('/library')
def library():
    return render_template('library.html')


@app.route('/contact')
def team():
    return render_template('contact.html')

#A class for registration form 
# kan cusub
class RegisterForm(Form):
    name = StringField('Name', [validators.length(min=3, max=50)], render_kw={'autofocus': True})
    username = StringField('Username', [validators.length(min=3, max=25)])
    email = EmailField('Email', [validators.DataRequired(), validators.Email(), validators.length(min=4, max=25)])
    password = PasswordField('Password', [validators.length(min=3)])
    DOB = StringField('DOB', [validators.length(min=3, max=50)], render_kw={'autofocus': True})
    address = StringField('address', [validators.length(min=3, max=50)], render_kw={'autofocus': True})
    department = StringField('department', [validators.length(min=3, max=50)], render_kw={'autofocus': True})
    course = StringField('course', [validators.length(min=3, max=50)], render_kw={'autofocus': True})
    mobile = StringField('mobile', [validators.length(min=3, max=50)], render_kw={'autofocus': True})

@app.route('/register', methods=['GET', 'POST'])
@not_logged_in
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        name = form.name.data
        email = form.email.data
        username = form.username.data
        password = sha256_crypt.encrypt(str(form.password.data))
        DOB = form.DOB.data
        address = form.address.data
        department = form.department.data
        course = form.course.data
        mobile = form.mobile.data


        # Create Cursor
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO school(name,DOB, email, address, department,course,mobile,username,password) VALUES(%s, %s, %s, %s,%s, %s, %s,%s, %s)",
                    (name,DOB, email, address, department,course,mobile,username,password))
        # Commit cursor
        mysql.connection.commit()

        # Close Connection
        cur.close()

        flash('You are now registered and can login', 'success')

        return redirect(url_for('login'))
    return render_template('register.html', form=form)


#Login Form Class
class LoginForm(Form):    # Create Message Form
    username = StringField('Username', [validators.length(min=1)], render_kw={'autofocus': True})

# User Login
@app.route('/login', methods=['GET', 'POST'])
@not_logged_in
def login():
    form = LoginForm(request.form)
    if request.method == 'POST' and form.validate():
        # GEt user form
        username = form.username.data
        password_candidate = request.form['password']
        # Create cursor
        cur = mysql.connection.cursor()

        # Get user by username
        result = cur.execute("SELECT * FROM school WHERE username=%s", [username])

        if result > 0:
            # Get stored value
            data = cur.fetchone()
            password = data['password']
            # Compare password
            if sha256_crypt.verify(password_candidate, password):
                # passed
                session['logged_in'] = True
                session['username'] = username

                flash('You are now logged in', 'success')
                return redirect(url_for('dashboard'))

            else:
                flash('Incorrect password', 'danger')
                return render_template('login.html', form=form)

        else:
            flash('Username not found', 'danger')
            # Close connection
            cur.close()
            return render_template('login.html', form=form)
    return render_template('login.html', form=form)


@app.route('/logout')
def logout():
    session.clear()
    flash('you are logged out, login again', 'success')
    return redirect(url_for('login'))

@app.route('/dashboard')
@is_logged_in
def dashboard():
    author = session['username']
    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM posts where author=%s", [author])

    posts = cur.fetchall()

    if result >0:
        return render_template('dashboard.html', posts=posts) #check
    else: 
        flash('no posts found', 'danger')
        return render_template('dashboard.html')
        cur.close()

class PostForm(Form):
    title = StringField('Title', [validators.length(min=10, max=200)])
    body  = TextAreaField('Body', [validators.length(min=50)])


@app.route('/add_post', methods=['Get','POST'])
@is_logged_in
def add_post():
    form = PostForm(request.form)
    if request.method == 'POST' and form.validate(): #check
        title = form.title.data
        body = form.body.data

        #create cursor
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO posts (title,body, author) VALUES (%s,%s,%s)", (title,body,session['username']))
        mysql.connection.commit()
        cur.close()

        flash('post created', 'success')
        return redirect(url_for('dashboard'))
    return render_template('add_post.html', form=form)

@app.route('/posts', methods=['GET','POST'])
def posts():
    cur = mysql.connection.cursor()

    result = cur.execute("SELECT  * FROM posts")

    posts = cur.fetchall()

    if result >0:
        return render_template('posts.html', posts=posts)
    else: 
        flash('no posts found', 'danger')
        return render_template('posts.html')
    cur.close()

#for a single post
@app.route('/post/<string:id>/')
def post(id):

    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM posts where id=%s", [id])
    post = cur.fetchone()

    return render_template("post.html", post=post)


#Editing route
@app.route('/edit_post/<string:id>', methods=['GET','POST'])
#@is_logged_in
def edit_post(id):
    cur = mysql.connection.cursor()

    result = cur.execute("SELECT * FROM posts WHERE id=%s", [id])

    post =  cur.fetchone()
    cur.close()

    form = PostForm(request.form)
    form.title.data = post['title']
    form.body.data = post['body']

    if request.method == 'POST' and form.validate():
        title = request.form['title']
        body = request.form['body']

        cur = mysql.connection.cursor()

        cur.execute("UPDATE posts SET title=%s, body=%s where id=%s", (title,body,id))

        mysql.connection.commit()
        cur.close()

        flash('Changes made', 'success')
        return redirect(url_for('dashboard'))
    return render_template('edit_post.html', form=form)


@app.route('/delete_post/<string:id>', methods=['POST'])
def delete_post(id):

    cur = mysql.connection.cursor()
    cur.execute("DELETE from posts where id=%s", id)
    mysql.connection.commit()
    cur.close()
    flash('post deleted', 'success')
    return redirect(url_for('dashboard'))

@app.route('/upfile')
def upfile():
    return render_template('upload.html')

APP_ROOT = os.path.dirname(os.path.abspath(__file__))
@app.route('/upload',  methods=['POST'])
def upload():
    target = os.path.join(APP_ROOT, 'upfiless/')
    print(target)
    if not os.path.isdir(target):
        os.mkdir(target)
    for file in request.files.getlist("file"):
        print(file)
        filename = file.filename
        destination = "/".join([target, filename])
        print(destination)
        file.save(destination)
    return render_template('complete.html')

if __name__ == '__main__':
    app.secret_key="HeyIam"
    app.run(debug=True)