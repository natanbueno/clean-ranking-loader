unit main_config_app;

interface

uses
  main_config_env,
  main_config_horse;
  //main_config_dmvcframework;

procedure Run();

implementation

procedure Run();
begin
  main_config_horse.RunServer(TConfigEnv.Port);
 // main_config_dmvcframework.RunServer(TConfigEnv.Port);
end;

end.
