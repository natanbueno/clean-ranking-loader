unit presentation_contract_http;

interface

uses
  System.SysUtils;

type

  THttpResponse = class
  private
    FstatusCode: Integer;
    FContent   : TObject;

  public
    procedure StatusCode( aStatusCode: Integer); overload;
    function  StatusCode: Integer overload;
    procedure data ( aContent: TObject); overload;
    function  data: TObject; overload;

  end;

  THttpHelper = class
    class function serverError ( data : TObject  ): THttpResponse;
    class function serverOk    ( data : TObject  ): THttpResponse;
  end;

implementation

{ THttpHelper }
class function THttpHelper.serverError ( data : TObject ): THttpResponse;
begin
  Result := THttpResponse.Create;
  Result.statusCode(500);
  Result.data( data );
end;

class function THttpHelper.serverOk( data : TObject   ): THttpResponse;
begin
  Result := THttpResponse.Create;
  Result.statusCode(200);
  Result.data(data);
end;

{ THttpResponse }
function THttpResponse.data: TObject;
begin
  Result := FContent;
end;

procedure THttpResponse.data(aContent: TObject);
begin
  FContent := aContent;
end;

procedure THttpResponse.StatusCode(aStatusCode: Integer);
begin
  FstatusCode := aStatusCode;
end;

function THttpResponse.StatusCode: Integer;
begin
  Result := FstatusCode;
end;

end.
