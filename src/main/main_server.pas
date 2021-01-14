unit main_server;

interface

uses
  main_config_app;

type
  TMainServer = class
    class procedure Run();
    class procedure Stop();
  end;
implementation

{ TMainServer }

class procedure TMainServer.Run;
begin
  main_config_app.Run;
end;


class procedure TMainServer.Stop;
begin

end;

end.
