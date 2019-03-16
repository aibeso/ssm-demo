package com.aibeso.dao;

/**
 * <p>
 * 用户mapper接口
 * </p>
 *
 * @author aibeso
 * @since 2019-03-17
 */
import java.util.List;
import java.util.Map;

import com.aibeso.model.User;

public interface IUserDao {
	public boolean insert (User user);
	public User selectById(int Id);
	public List<User> selectListByIds(List ids);
	public List<User> listAll();
	public List<User> listAll(Map<String, Object> map);	
	public boolean updata(User user);
	public boolean deleteById(int id);
	public Integer count(User user);
}
