/* eslint-disable no-unused-vars */
const passport = require("passport");
const cookieSession = require("cookie-session");
const allowedUsers = ["chammu.b@gmail.com"];
require("../auth/passport");

const routes = {
  HOME: "/",
  AUTH_LOGIN: "/auth/google",
  AUTH_LOGOUT: "/auth/logout",
  AUTH_CALLBACK: "/auth/google/callback",
  AUTH_USER: "/auth/logged-user",
  LAUNCHPAD_HOME: "/launchpad/index.html",
  LOGIN: "/launchpad/login.html",
};
const cookiesSessionName = "google-auth-session";

module.exports = async (app) => {
  app.use(
    cookieSession({
      name: cookiesSessionName,
      keys: ["key1", "key2"],
      cookie: {
        secure: false,
        httpOnly: true,
        path: "cookie",
        expires: new Date(Date.now() + 60 * 60 * 1000 * 1 * 1), // * 24 * 365
      },
    })
  );
  app.use(passport.initialize());
  app.use(passport.session());

  /**
   * Added for the purpose of oAuth example
   */

  const authenticate = function (req, success, failure) {
    // Use the Google strategy with passport.js, but with a custom callback.
    // passport.authenticate returns Connect middleware that we will use below.
    //
    // For reference: http://passportjs.org/guide/authenticate/
    return passport.authenticate(
      "google",
      { scope: ["email profile"] },
      // This is the 'custom callback' part
      function (err, user, info) {
        if (err) {
          failure(err);
        } else if (!user) {
          failure("Invalid login data");
        } else {
          // Here, you can do what you want to control
          // access. For example, you asked to deny users
          // with a specific email address:
          const users =
            allowedUsers.filter((value) => value === user.emails[0].value) ||
            [];
          const haveAccess = users.length > 0;

          if (haveAccess) {
            // req.login is added by the passport.initialize()
            // middleware to manage login state. We need
            // to call it directly, as we're overriding
            // the default passport behavior.
            req.login(user, (err) => {
              if (err) {
                failure(err);
              }
              success();
            });
          } else {
            failure("User not allowed");
          }
        }
      }
    );
  };

  // This defines what we send back to clients that want to authenticate
  // with the system.
  const authMiddleware = (req, res, next) => {
    const success = () => {
      res.redirect(routes.LAUNCHPAD_HOME);
    };

    const failure = (error) => {
      console.log(error);
      res.redirect(routes.LOGIN);
    };

    const middleware = authenticate(req, success, failure);
    middleware(req, res, next);
  };

  const isLoggedIn = (req, res, next) => {
    if (req.user) {
      next();
    } else {
      res.redirect(routes.LOGIN);
    }
  };

  if (process.env.NODE_ENV === "PROD") {
    // home
    app.get(routes.HOME, isLoggedIn, (req, res) =>
      res.redirect(routes.LAUNCHPAD_HOME)
    );
  }

  // launchpad
  app.get(routes.LAUNCHPAD_HOME, isLoggedIn);

  // logged in user info
  app.get(routes.AUTH_USER, (req, res) => {
    res.json(req?.user?._json);
  });

  /**
   * Google passport login & callback
   */

  // login
  app.get(
    routes.AUTH_LOGIN,
    passport.authenticate("google", { scope: ["email profile"] })
  );

  // google login callback
  app.get(routes.AUTH_CALLBACK, authMiddleware);

  // logout
  app.post(routes.AUTH_LOGOUT, async (req, res) => {
    await req.logout();
    req.session = null;
    res.clearCookie(cookiesSessionName);
    res.clearCookie(`${cookiesSessionName}.sig`);
    res.json({ msg: "Logout Sucessfull!" });
  });
};
