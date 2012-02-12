class user_account::sysadmins() {
  include user_account::virtual
  realize(UserAccount['cirode']) 
}