//Auto-generated by RSP Compiler
//Source: spaces.rsp.html
part of trails;

/** Template, spaces, for rendering the view. */
Future spaces(HttpConnect connect, {nw, ne, sw, se}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  return Rsp.nnf(loading(new HttpConnect.chain(connect))).then((_) { //include#2

    response.write("""<div class="spaces" >
	<div class="space space-north-west"  > 
	  <div class="inner-space" >
        """); //#3

    response.write(Rsp.nnx(nw, encode: 'none')); //#6


    response.write("""

  	  </div>
	</div>
	<div class="space space-north-east"  >
	  <div class="inner-space" >
        """); //#6

    response.write(Rsp.nnx(ne, encode: 'none')); //#11


    response.write("""

  	  </div>
    </div>
	<div class="space space-south-west"  > 
	  <div class="inner-space" >
        """); //#11

    response.write(Rsp.nnx(sw, encode: 'none')); //#16


    response.write("""

  	  </div>
 	</div>
	<div class="space space-south-east"  >
	  <div class="inner-space" >
        """); //#16

    response.write(Rsp.nnx(se, encode: 'none')); //#21


    response.write("""

  	  </div>
	</div>
"""); //#21

    return Rsp.nnf(center(new HttpConnect.chain(connect))).then((_) { //include#24

      return Rsp.nnf(menu(new HttpConnect.chain(connect))).then((_) { //include#25

        response.write("""</div>
"""); //#26

        return new Future.value();
      }); //end-of-include
    }); //end-of-include
  }); //end-of-include
}
