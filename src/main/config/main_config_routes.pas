unit main_config_routes;

interface

uses
  Horse,
  //MVCFramework,

  main_route_ranking;

type
  TConfigRoutes = class
    class procedure setupRoutes (app: THorse); overload;
//    class procedure setupRoutes (app: TMVCEngine); overload;
  end;

implementation


{ TConfigRoutes }

class procedure TConfigRoutes.setupRoutes(app: THorse);
begin
  main_route_ranking.Registry(App);
end;

//class procedure TConfigRoutes.setupRoutes(app: TMVCEngine);
//begin
//  main_route_ranking.Registry(App);
//end;

end.
