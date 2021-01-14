unit presentation_viewmodel_server_error;

interface

uses
  System.JSON;

type
  TServerErrorViewModel = class
  private
    FStatusCode: Integer;
    FMsg       : String;

  public
    property StatusCode: Integer read FStatusCode write FStatusCode;
    property MsgError  : String  read FMsg        write FMsg;

    function ToJson: TJSONOBject;
  end;

implementation


function TServerErrorViewModel.ToJson: TJSONOBject;
begin
  Result := TJSONObject.Create;
// Result.AddPair(TJSONPair.Create('statuscode', TJSONNumber.Create(FStatusCode)));
  Result.AddPair(TJSONPair.Create('error', TJSONString.Create(FMsg)));
end;

end.
