unit main_adapter_horse_router;

interface

uses
  presentation_contract_controller,
  presentation_contract_http,

  Horse.Core.RouterTree,
  Horse.HTTP,
  Horse.Proc,

  System.JSON;

function adaptRoute(controller: IController): THorseCallback;

implementation

function adaptRoute(controller: IController): THorseCallback;
begin
  Result := procedure(req: THorseRequest; res: THorseResponse; Next: TNextProc)
            var
              Response: THttpResponse;
            begin
              Response := controller.handle;
              res.Status(response.StatusCode).Send<TJSONValue>(TJSONValue(Response.data));

              Response.free;
            end;
end;


end.
