package com.swiggy.dao;
import com.swiggy.dto.Users;
import java.util.List;

public interface UsersDao {
	public Users insertUsers(Users u);
	public boolean deleteUsers(Users u);
	public Users updateUsers(Users u);
	public Users getUser(int userId);
	public List<Users> getUsers();
	public Users getUser(String email);
}
