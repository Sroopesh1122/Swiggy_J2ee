package com.swiggy.dao;
import com.swiggy.dto.Users;
import java.util.List;

public interface UsersDao {
	public Users insertUsers(Users u);
	public boolean deleteUsers(Users u);
	public Users updateUsers(Users u);
	public Users getUsers(int id);
	public List<Users> getUsers();
}
