//Auto-generated by RSP Compiler
//Source: sharedWidgets.rsp.html
part of trails;

/** Template, sharedWidgets, for rendering the view. */
Future sharedWidgets(HttpConnect connect, {sharedWidgetsId}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""

<div id=\""""); //#2

  response.write(Rsp.nnx(sharedWidgetsId)); //#3


  response.write("""" class="gx-hidden"  >
"""); //#3

  return Rsp.nnf(menuWidget(new HttpConnect.chain(connect), menuId: "menu")).then((_) { //include#4

    return Rsp.nnf(persistentMenuWidget(new HttpConnect.chain(connect), persistentMenuId: "persistentMenu")).then((_) { //include#5

      return Rsp.nnf(loginWidget(new HttpConnect.chain(connect), loginId: "loginModal")).then((_) { //include#6

        return Rsp.nnf(registerWidget(new HttpConnect.chain(connect), registerId: "registerModal")).then((_) { //include#7

          return Rsp.nnf(headerWidget(new HttpConnect.chain(connect), headerId: "header")).then((_) { //include#8

            return Rsp.nnf(logoutWidget(new HttpConnect.chain(connect), logoutId: "logoutSilent")).then((_) { //include#9

              response.write("""</div>"""); //#10

              return new Future.value();
            }); //end-of-include
          }); //end-of-include
        }); //end-of-include
      }); //end-of-include
    }); //end-of-include
  }); //end-of-include
}
