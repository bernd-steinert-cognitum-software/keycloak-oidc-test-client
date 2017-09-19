<%@ page import="org.keycloak.AuthorizationContext" %>
<%@ page import="org.keycloak.KeycloakSecurityContext" %>
<%@ page import="org.keycloak.representations.AccessToken" %>
<%@ page import="org.keycloak.representations.IDToken" %>
<%@ page import="org.keycloak.common.util.Base64Url" %>
<%@ page import="org.json.JSONObject" %>

<%
    class JsonWebTokenDecoder {

        String decode(String token) {
            String[] parts = token.split("\\.");
            if (parts.length < 2 || parts.length > 3) throw new IllegalArgumentException("Parsing error");

            return new String(Base64Url.decode(parts[1]));
        }

        String format(String raw) {
            return new JSONObject(decode(raw)).toString(2);
        }
    }
    KeycloakSecurityContext keycloakSecurityContext = (KeycloakSecurityContext) request.getAttribute(KeycloakSecurityContext.class.getName());

    String accessTokenDecoded = new JsonWebTokenDecoder().format(keycloakSecurityContext.getTokenString());
    AccessToken accessToken = keycloakSecurityContext.getToken();
%>

<html>
<body>

    <h3>Access Token:</h3>
    <table border="1">
        <tr>
            <td>
                Token (encoded)
            </td>
            <td>
                <%= keycloakSecurityContext.getTokenString() %>
            </td>
        </tr>
        <tr>
        <tr>
            <td>
                Token (decoded)
            </td>
            <td>
                <pre><%= accessTokenDecoded %></pre>
            </td>
        </tr>
        <tr>
        </li>
    </ul>
</body>
