//Auto-generated by RSP Compiler
//Source: uploadFileWidget.rsp.html
part of trails;

/** Template, uploadFileWidget, for rendering the view. */
Future uploadFileWidget(HttpConnect connect, {uploadFileId, uploadFileText}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""

  <div id=\""""); //#2

  response.write(Rsp.nnx(uploadFileId)); //#3


  response.write("""" style="position:relative;" >
    """); //#3

  response.write(Rsp.nnx(uploadFileText)); //#4


  response.write("""

      &nbsp;
    <a id=\""""); //#4

  response.write(Rsp.nnx(uploadFileId)); //#6


  response.write("""-link" class="gx-as-link" >  
      <img src='/assets/img/upload.png' style="height: 27px" />
      <input id=\""""); //#6

  response.write(Rsp.nnx(uploadFileId)); //#8


  response.write("""-input" type="file" class="gx-hidden" ></input>
    </a>
    &nbsp;
    <span id=\""""); //#8

  response.write(Rsp.nnx(uploadFileId)); //#11


  response.write("""-info"></span>
  </div>
"""); //#11

  return new Future.value();
}
