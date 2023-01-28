<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function login() {
		location.href="/ourHW/signup/login.jsp";
	}
	function join() {
		location.href="/ourHW/signup/signup.jsp";
	}
	function cart() {
		location.href="/ourHW/controller?type=cart";
	}
	function search() {
		var search = document.getElementById('search').value;
		console.log("검색할 단어 : " + search);
		location.href="/ourHW/controller?type=search&search=" + search;
	}
	function logout(){
		location.href="/ourHW/controller?type=logout";
	}
</script>