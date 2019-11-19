import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_type.dart';
import 'package:flutter_app/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _authKey = GlobalKey();
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        image: AssetImage('assets/logo.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop));
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 768.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(

        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
              decoration: BoxDecoration(
                image: _buildBackgroundImage(),
              ),
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                    child: Form(
                  key: _authKey,
                  child: Container(
                      width: targetWidth,
                      child: Column(
                        children: <Widget>[
                          _buildEmailTextField(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildPasswordsTextField(),
                          _buildAcceptSwitch(),
                          SizedBox(
                            height: 10.0,
                          ),
                          ScopedModelDescendant<MainModel>(builder:
                              (BuildContext context, Widget child,
                                  MainModel model) {
                            return RaisedButton(
                              child: Text('Login'),
                              textColor: Colors.white,
                              onPressed: () => _submitForm(model.login),
                            );
                          })
                        ],
                      )),
                )),
              )),
        ));
  }

  void _submitForm(Function login) async {
    if (!_authKey.currentState.validate()) {
      return;
    }
    _authKey.currentState.save();
    UserType userType = await login(_formData['email'], _formData['password']);
    switch(userType) {
      case UserType.student:
        //Navigator.pushReplacementNamed(context, '/student/subjects');
        Navigator.pushReplacementNamed(context, '/student/subjects');
        break;
      case UserType.teacher:
        break;
      default:
        return;
    }

  }

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
/*      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'E-mail field can not be empty and needs to be a valid e-mail';
        }
      },*/
      onSaved: (String value) {
        _formData['email'] = value;
      },
      decoration: InputDecoration(
          labelText: 'E-mail', filled: true, fillColor: Colors.white),
    );
  }

  Widget _buildPasswordsTextField() {
    return TextFormField(
      obscureText: true,
/*      validator: (String value) {
        if (value.isEmpty) {
          return 'Password can not be empty';
        }
      },*/
      onSaved: (String value) {
        _formData['password'] = value;
      },
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text('Accept Terms'),
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
    );
  }
}
