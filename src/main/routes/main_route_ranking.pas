unit main_route_ranking;

interface

uses
  main_factorie_controller_load_last_ranking,
  main_config_env,
  main_adapter_horse_router,

  //MVCFramework,
  //main_adapter_dmvc_router_ranking;

  Horse;

procedure Registry( app: THorse);
//procedure Registry ( app: TMVCEngine);

implementation

procedure Registry ( app: THorse);
var
  LResource: String;
begin
  LResource := TConfigEnv.api_version + '/ranking';
  app.Get(LResource + '/last', main_adapter_horse_router.adaptRoute( makeLoadLastRankingController.New ));
end;

//procedure Registry ( app: TMVCEngine);
//begin
//  app.AddController(TMVCRouterRanking)
//end;

end.
