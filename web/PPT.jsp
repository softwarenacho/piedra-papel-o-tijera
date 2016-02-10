<%-- 
    Document   : PPT
    Created on : 13/10/2015, 01:55:54 AM
    Author     : Ignacio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
    <link rel='stylesheet' type='text/css' href='estilo.css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:500' rel='stylesheet' type='text/css'>
    <title>Juego de piedra, papel y tijera</title>
    </head>
    <body>

    <%    
    String eleccionUs, eleccionServ="", ganador="", nuevo, mensaje="", juego="";
    int aleatorio = (int)(Math.random()*(3)+1);
    int triunfosUs=0, triunfosServ=0, empates=0, pGanadasUs=0, pGanadasServ=0, pEmpatadas=0;
    
    
    //ASIGNACION DE VALORES INTERNOS
    eleccionUs = request.getParameter("juego");
    
    nuevo = request.getParameter("nuevo");
    if(nuevo.equals("yes")){
        triunfosUs=0;
        triunfosServ=0;
        empates=0;
        pGanadasUs=0;
        pGanadasServ=0;
        pEmpatadas=0;
    } else {
        triunfosUs = Integer.parseInt(request.getParameter("triunfosUsuario"));
        triunfosServ = Integer.parseInt(request.getParameter("triunfosServidor"));
        empates = Integer.parseInt(request.getParameter("empates"));
        pGanadasUs = Integer.parseInt(request.getParameter("ganadasUsuario"));
        pGanadasServ = Integer.parseInt(request.getParameter("ganadasServidor"));
        pEmpatadas = Integer.parseInt(request.getParameter("partidasEmpatadas"));
    }
    
    if(aleatorio==1){
        eleccionServ = "piedra";
    }else{ 
        if(aleatorio==2){
            eleccionServ = "papel";
        } else {
            if(aleatorio==3){
                eleccionServ = "tijera";
            }
        }
    }
            
    if(eleccionServ.equals(eleccionUs)){
        ganador = "Empate";
        empates++;
        juego = "El juego se empató";
    }else{
        if(eleccionUs.equals("piedra")){
            if(eleccionServ.equals("tijera")){
                ganador = "Usuario";
                triunfosUs++;
                juego = "Ganaste el juego";
            }else{
                ganador= "Servidor";
                triunfosServ++;
                juego = "Perdiste el juego";
            }
        }
        if(eleccionUs.equals("papel")){
            if(eleccionServ.equals("piedra")){
                ganador = "Usuario";
                triunfosUs++;
                juego = "Ganaste el juego";
            }else{
                ganador = "Servidor";
                triunfosServ++;
                juego = "Perdiste el juego";
            }
        }    
        if(eleccionUs.equals("tijera")){ 
            if(eleccionServ.equals("papel")){
                ganador = "Usuario";
                triunfosUs++;
                juego = "Ganaste el juego";
            }else{
                ganador = "Servidor";
                triunfosServ++;
                juego = "Perdiste el juego";
            }
        }
    }
    
        if(triunfosUs==3 || triunfosServ==3 || empates==3){
        if(triunfosUs==triunfosServ){
            pEmpatadas++;
            mensaje = "Se ha empatado esta partida :/";
        } else{
            if(triunfosServ<triunfosUs){
                pGanadasUs++;
                mensaje = "Has ganado esta partida xD";
            }
            if(triunfosServ>triunfosUs){
                pGanadasServ++;
                mensaje = "El servidor ganó la partida :_(";
            }
        }
        triunfosUs=0;
        triunfosServ=0;
        empates=0;
    }
    %>

    <h1>Juego de piedra, papel y tijera</h1>

        <!--TABLA DE ESTADISTICAS-->
        <table>
            <tr>
                <th></th>
                <th>Usuario</th>
                <th>Servidor</th>
            </tr>
            <tr>
                <th>Jugada elegida</th>
                <td>
                    <%= eleccionUs %>
                </td>
                <td>
                    <%= eleccionServ %>
                </td>
            </tr>
            <tr>
                <th>Ganador jugada</th>
                <td colspan='2'>
                    <%= ganador %>
                </td>
            </tr>
            <tr>
                <th>Triunfos</th>
                <td>
                    <%= triunfosUs %>
                </td>
                <td>
                    <%= triunfosServ %>
                </td>
            </tr>
            <tr>
                <th>Empates</th>
                <td colspan='2'>
                    <%= empates %>
                </td>
            </tr>
            <tr>
                <th>Partidas ganadas</th>
                <td>
                    <%= pGanadasUs %>
                </td>
                <td>
                    <%= pGanadasServ %>
                </td>
            </tr>
            <tr>
                <th>Partidas empatadas</th>
                <td colspan='2'>
                    <%= pEmpatadas %>
                </td>
            </tr>
        </table>
        <h2><%= juego %><br><%= mensaje %></h2>

        <i>Cada partida consta de hasta 5 juegos</i>
        <br><br>


        <!--FORMULARIO DE SELECCION DE JUGADA-->
        <form action='PPT.jsp' method='POST'>  
            <fieldset> 
                <legend> Selecciona tu siguiente jugada:</legend><br> 
                <label><input type='radio' id='piedra' name='juego' value='piedra' checked> Piedra</label> 
                <label><input type='radio' id='papel' name='juego' value='papel'> Papel </label>
                <label><input type='radio' id='tijera' name='juego' value='tijera'> Tijera</label>
                <input type='hidden' name='triunfosUsuario' value='<%= triunfosUs %>'>
                <input type='hidden' name='triunfosServidor' value='<%= triunfosServ %>'>
                <input type='hidden' name='empates' value='<%= empates %>'>
                <input type='hidden' name='ganadasUsuario' value='<%= pGanadasUs %>'>
                <input type='hidden' name='ganadasServidor' value='<%= pGanadasServ %>'>
                <input type='hidden' name='partidasEmpatadas' value='<%= pEmpatadas %>'>                
                <input type='hidden' name='nuevo' value='no'>
                <br><br> 
                <input type='submit' value='Enviar selección'> 
            </fieldset> 
        </form> 

        <br><br> 

        <a href='index.html'>Reiniciar el juego</a>
        
        <p>Nacho Betancourt, 121015</p>
  
    </body> 
    </html>

