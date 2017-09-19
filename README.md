keycloak-oidc-test-client
=========================


What is it?
-----------

This is a skeleton for a Java Web Application that can be configured with minimal
effort to connect to a Keycloak realm via OpenID Connect.

The goal is just to validate the setup and provide a simple tool for debugging on
client side (keycloakOidcSnoop.jsp).
 
This should of course not be used in production environment ;-) 


System Requirements
-------------------

- Java 8.0 (Java SDK 1.8) or later.


HowTo
-----

1.  Configure your client in Keycloak
2.  Put the client configuration file `keycloak.json` into `./src/main/webapp/WEB-INF`
3.  Modify `./src/main/webapp/WEB-INF/web.xml` to your needs _(optional)_
4.  Start the Application with `./gradlew tomcatRun`
5.  Open the address in your browser and see what happens
    (usually you should be redirected to your authentication page)
