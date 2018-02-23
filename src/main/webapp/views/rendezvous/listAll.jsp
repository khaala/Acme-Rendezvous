<%--
  Created by IntelliJ IDEA.
  User: yuzi
  Date: 2/19/18
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags" %>


<display:table name="rendezvous" id="row" pagesize="10" class="displaytag" requestURI="${requestUri}">

    <jstl:set var="now" value="${now}"/>

    <display:column>
   <a href="user/display.do?userId=${row.creator.id}"><jstl:out value="${row.creator.name}"/></a>
    <br/>
    </display:column>

    <acme:column code="rendezvous.name" value="${row.name}"/>
    <acme:column code="rendezvous.description" value="${row.description}"/>
    <acme:column code="rendezvous.moment" value="${row.moment}" sortable="true"/>

    <display:column>
        <jstl:set var="contains" value="false" />


        <jstl:if test="${row.deleted eq true && row.moment ge now}">
            <spring:message code="rendezvous.deleted" var="delet"/><jstl:out value="${delet}"/>
        </jstl:if>


        <jstl:if test="${row.moment lt now }">
            <spring:message code="rendezvous.passed" var="passed"/><jstl:out value="${passed}"/>
        </jstl:if>
    </display:column>

    <display:column >
        <acme:button url="rendezvous/display.do?rendezvousId=${row.id}" code="rendezvous.display"/>
    </display:column>






</display:table>





