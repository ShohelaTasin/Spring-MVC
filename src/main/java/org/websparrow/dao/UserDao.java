package org.websparrow.dao;
// UserDao.java
@Repository
public class UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void saveUser(User user) {
        String sql = "INSERT INTO users (first_name, last_name) VALUES (?, ?)";
        jdbcTemplate.update(sql, user.getFirstName(), user.getLastName());
    }

    public List<User> getAllUsers() {
        String sql = "SELECT * FROM users";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    public User getUserById(Long userId) {
        String sql = "SELECT * FROM users WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{userId}, new BeanPropertyRowMapper<>(User.class));
    }

    public void updateUser(User user) {
        String sql = "UPDATE users SET first_name = ?, last_name = ? WHERE id = ?";
        jdbcTemplate.update(sql, user.getFirstName(), user.getLastName(), user.getId());
    }

    public void deleteUser(Long userId) {
        String sql = "DELETE FROM users WHERE id = ?";
        jdbcTemplate.update(sql, userId);
    }
}