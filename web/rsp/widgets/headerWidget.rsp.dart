//Auto-generated by RSP Compiler
//Source: headerWidget.rsp.html
part of trails;

/** Template, headerWidget, for rendering the view. */
Future headerWidget(HttpConnect connect, {headerId}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""<div id=\""""); //#2

  response.write(Rsp.nnx(headerId)); //#2


  response.write(""""   >
   <h1 id=\""""); //#2

  response.write(Rsp.nnx(headerId)); //#3


  response.write("""-title"  ></h1>
"""); //#3

  return Rsp.nnf(connectedUserWidget(new HttpConnect.chain(connect))).then((_) { //include#4

    response.write("""


   <div id=\""""); //#5

    response.write(Rsp.nnx(headerId)); //#7


    response.write("""-left">
     <span id=\""""); //#7

    response.write(Rsp.nnx(headerId)); //#8


    response.write("""-menu" class='gx-as-link' >
        <a title="Actions possibles" ><img id=\""""); //#8

    response.write(Rsp.nnx(headerId)); //#9


    response.write("""-menu-img" src='/assets/img/menu.png '  /></a>
     </span>
     
     <span id=\""""); //#9

    response.write(Rsp.nnx(headerId)); //#12


    response.write("""-register" class='gx-as-link """); //#12

    response.write(Rsp.nnx(currentUser(request.session) != null ? "gx-hidden" : "")); //#12


    response.write("""' >
        <a title="S'enregister" ><img  alt="S'enregister" src='/assets/img/register.png'  /></a>
     </span>     
     <span id=\""""); //#12

    response.write(Rsp.nnx(headerId)); //#15


    response.write("""-login" class='gx-as-link """); //#15

    response.write(Rsp.nnx(currentUser(request.session) != null ? "gx-hidden" : "")); //#15


    response.write("""' >
        <a title="Se connecter" ><img  src='/assets/img/login.png '  /></a>
     </span>
     <span id=\""""); //#15

    response.write(Rsp.nnx(headerId)); //#18


    response.write("""-logout" class='gx-as-link """); //#18

    response.write(Rsp.nnx(currentUser(request.session) == null ? "gx-hidden" : "")); //#18


    response.write("""' >
        <a title="Se déconnecter" ><img  src='/assets/img/logout.png '  /></a>
     </span>

     <span id=\""""); //#18

    response.write(Rsp.nnx(headerId)); //#22


    response.write("""-user" class='gx-as-link """); //#22

    response.write(Rsp.nnx(currentUser(request.session) != null &&  ! currentUser(request.session).admin  ?  "" : "gx-hidden")); //#22


    response.write("""' >
        <a title='Utilisateur """); //#22

    response.write(Rsp.nnx(currentUser(request.session) != null  ?  currentUser(request.session).login : "")); //#23


    response.write(""" (en construction)' ><img  src='/assets/img/user.png '  /></a>
     </span>
     <span id=\""""); //#23

    response.write(Rsp.nnx(headerId)); //#25


    response.write("""-admin" class='gx-as-link """); //#25

    response.write(Rsp.nnx(currentUser(request.session) != null &&   currentUser(request.session).admin  ?  "" : "gx-hidden")); //#25


    response.write("""' >
        <a title='Admin """); //#25

    response.write(Rsp.nnx(currentUser(request.session) != null  ?  currentUser(request.session).login : "")); //#26


    response.write(""" (en construction) ' ><img  src='/assets/img/admin.png '  /></a>
     </span>     
        
   </div>

   <div id=\""""); //#26

    response.write(Rsp.nnx(headerId)); //#31


    response.write("""-right">
     <span id=\""""); //#31

    response.write(Rsp.nnx(headerId)); //#32


    response.write("""-pages" class='gx-as-link'  >
        <a title="Accès aux pages (en construction)" ><img  src='/assets/img/pages.png'  /></a>
     </span>
     <span id=\""""); //#32

    response.write(Rsp.nnx(headerId)); //#35


    response.write("""-close" class='gx-as-link' >
        <a title="Fermer la page courante (en construction)" ><img  src='/assets/img/close.png'  /></a>
     </span>        
   </div>
   
</div>
"""); //#35

    return new Future.value();
  }); //end-of-include
}
