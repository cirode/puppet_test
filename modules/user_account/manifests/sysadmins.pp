class user_account::sysadmins {
  include user_account::virtual
  realize(User_account['cirode']) 
}