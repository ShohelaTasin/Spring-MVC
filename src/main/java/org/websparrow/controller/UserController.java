package org.websparrow.controller;
// UserController.java
@Controller
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserDao userDao;

    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userDao.getAllUsers();
        model.addAttribute("users", users);
        return "user/list";
    }

    @GetMapping("/new")
    public String newUserForm(Model model) {
        model.addAttribute("user", new User());
        return "user/new";
    }

    @PostMapping("/new")
    public String saveUser(@ModelAttribute("user") User user) {
        userDao.saveUser(user);
        return "redirect:/users";
    }

    @GetMapping("/edit/{id}")
    public String editUserForm(@PathVariable Long id, Model model) {
        User user = userDao.getUserById(id);
        model.addAttribute("user", user);
        return "user/edit";
    }

    @PostMapping("/edit/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute("user") User user) {
        user.setId(id);
        userDao.updateUser(user);
        return "redirect:/users";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userDao.deleteUser(id);
        return "redirect:/users";
    }
}