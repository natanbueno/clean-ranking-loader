unit main_config_horse;

interface

uses
  Horse,
  Horse.Jhonson,

  main_config_env,
  main_config_routes;

var
  App: THorse;

procedure RunServer(APort: Integer);

implementation

procedure RunServer(APort: Integer);
begin
  App := THorse.Create;
  App.Use(Jhonson);
  TConfigRoutes.setupRoutes(App);
  App.Listen(Aport);
end;

end.
