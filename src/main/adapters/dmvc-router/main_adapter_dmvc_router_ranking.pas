unit main_adapter_dmvc_router_ranking;

interface

uses
  MVCFramework,
  MVCFramework.Commons,

  main_factorie_controller_load_last_ranking,
  presentation_contract_http,

  System.JSON;

type

 // [MVCPath(TConfigEnv.api_version + '/ranking')]
  [MVCPath('/myapi/v1/ranking')]
  TMVCRouterRanking = class(TMVCController)
  protected

    procedure OnBeforeAction(AContext: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(AContext: TWebContext; const AActionName: string); override;
  public

    [MVCPath('/last')]
    [MVCHTTPMethod([httpGET])]
    procedure Get;

  end;

implementation

{ TMVCRouterRanking }

procedure TMVCRouterRanking.Get;
var
  Response: THttpResponse;
begin
  Response := makeLoadLastRankingController.New.handle;
  Self.Render(TJSONArray(Response.data));
  Response.Free;
end;

procedure TMVCRouterRanking.OnAfterAction(AContext: TWebContext;const AActionName: string);
begin
  inherited;
end;

procedure TMVCRouterRanking.OnBeforeAction(AContext: TWebContext;
  const AActionName: string; var Handled: Boolean);
begin
  inherited;

end;

end.
