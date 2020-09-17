package com.lambdaschool.shoppingcart.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lambdaschool.shoppingcart.models.Role;
import com.lambdaschool.shoppingcart.models.User;
import com.lambdaschool.shoppingcart.models.UserRoles;
import com.lambdaschool.shoppingcart.services.UserService;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import io.restassured.module.mockmvc.RestAssuredMockMvc;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@WithMockUser(username = "admin", roles = {"USER", "ADMIN"})
public class UserControllerTest {

    @Autowired
    private WebApplicationContext webApplicationContext;

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserService userService;

    private List<User> userList;

    @Before
    public void setUp() throws Exception {
        userList = new ArrayList<>();

        Role r1 = new Role("admin");
        Role r2 = new Role("user");
        Role r3 = new Role("data");

        r1.setRoleid(1);
        r2.setRoleid(2);
        r3.setRoleid(3);

        // admin, data, user
        User u1 = new User("admin",
                "password",
                "adminTEST@lambdaschool.local");
        u1.setUserid(10);

        u1.getRoles()
                .add(new UserRoles(u1, r1));
        u1.getRoles()
                .add(new UserRoles(u1, r2));
        u1.getRoles()
                .add(new UserRoles(u1, r3));
        userList.add(u1);

        // data, user
        User u2 = new User("cinnamon",
                "1234567",
                "cinnamonTEST@lambdaschool.local");
        u2.setUserid(20);

        u2.getRoles()
                .add(new UserRoles(u2, r2));
        u2.getRoles()
                .add(new UserRoles(u2, r3));
        userList.add(u2);

        // user
        User u3 = new User("barnbarn",
                "ILuvM4th!",
                "barnbarnTEST@lambdaschool.local");
        u3.setUserid(30);

        u3.getRoles()
                .add(new UserRoles(u3, r2));
        userList.add(u3);

        User u4 = new User("puttat",
                "password",
                "puttatTEST@school.lambda");
        u4.setUserid(40);

        u4.getRoles()
                .add(new UserRoles(u4, r2));

        userList.add(u4);

        User u5 = new User("misskitty",
                "password",
                "misskittyTEST@school.lambda");
        u5.setUserid(50);

        u5.getRoles()
                .add(new UserRoles(u5, r2));

        userList.add(u5);

        RestAssuredMockMvc.webAppContextSetup(webApplicationContext);

        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void listAllUsers() throws Exception{
        var apiUrl = "/users/users";
        Mockito.when(userService.findAll()).thenReturn(userList);

        var builder = get(apiUrl).accept(MediaType.APPLICATION_JSON);
        var result = mockMvc.perform(builder).andReturn();
        var jsonResult = result.getResponse().getContentAsString();

        var usersAsJson = new ObjectMapper().writeValueAsString(userList);
        assertEquals(jsonResult, usersAsJson);
    }

    @Test
    public void getUserById() throws Exception{
            String apiUrl = "/users/user/12";

            Mockito.when(userService.findUserById(12))
                    .thenReturn(userList.get(1));

            RequestBuilder rb = MockMvcRequestBuilders.get(apiUrl)
                    .accept(MediaType.APPLICATION_JSON);
            MvcResult r = mockMvc.perform(rb)
                    .andReturn(); // this could throw an exception
            String tr = r.getResponse()
                    .getContentAsString();

            ObjectMapper mapper = new ObjectMapper();
            String er = mapper.writeValueAsString(userList.get(1));

            System.out.println("Expect: " + er);
            System.out.println("Actual: " + tr);

            assertEquals("Rest API Returns List", er, tr);
    }

    @Test
    public void addUser() {
    }

    @Test
    public void deleteUserById() {
    }

    @Test
    public void getMyInfo() {
    }
}