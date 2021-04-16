<%-- 
    Document   : insurance_css
    Created on : Apr 1, 2020, 2:28:28 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <style>
            body {
                margin: 0;
                font-family: Helvetica;
            }
            
            .quotation{
                padding: 30px;
            }
            .quotation table{
                background-color: white;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                justify-content: center
            }

            .row div {
                padding: 10px;
                margin: 10px;
                border-radius: 20px
            }

            .navbar {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .main {
                display: flex;
                justify-content: center;
            }

            .main div {
                margin: 10px;
                padding: 10px;
                border-radius: 20px;
                text-align: center
            }

            .delete {
                background-color: white;
                color: red;
                border: 1px solid red;
            }

            .delete:hover {
                background-color: red;
                color: white;
            }

            .update {
                border-radius: 20px;
                border: none;
                padding-left: 20px;
                padding-right: 20px;
                padding-top: 7px;
                padding-bottom: 7px;
                font-weight: bold;
                cursor: pointer;
                background-color: lightgrey;
            }


            a {
                padding-left: 20px;
                padding-right: 20px;
                padding-top: 5px;
                padding-bottom: 5px;
                background-color: lightgrey;
                text-decoration: none;
                color: black;
                font-weight: bold;
            }

            a:hover {
                color: white;
                background-color: black;
                transition: 0.3s;
            }


            table {
                padding: 10px;
                margin-left: auto;
                margin-right: auto;
                text-align: left;
                border: 1px solid;
                border-radius: 20px;
            }

            td {
                padding: 10px;
                text-align: center;
            }

            th {
                padding: 10px;
            }

            button {
                border-radius: 20px;
                border: none;
                padding-left: 20px;
                padding-right: 20px;
                padding-top: 7px;
                padding-bottom: 7px;
                font-weight: bold;
                cursor: pointer;
                background-color: lightgrey;
            }

            button:hover {
                color: white;
                background-color: black;
                transition: 0.3s;
            }


            input {
                padding: 5px;
            }

            select {
                padding: 5px;
                width: 100%
            }

            @media screen and (max-width: 1200px) {

                .row,
                .main {
                    display: flex;
                    flex-direction: column;
                    text-align: center
                }
            }



        </style>
    </head>


</html>

<!--
 Copyright (C) Ariff Norhadi - All Rights Reserved
 You may use, distribute and modify this code under the
 terms of the XYZ license, which unfortunately won't be
 written for another century.
 
 You should have received a copy of the XYZ license with
 this file. If not, please write to: ariffnorhadi@gmail.com ,
 or visit https://t.me/ariffnorhadi
-->