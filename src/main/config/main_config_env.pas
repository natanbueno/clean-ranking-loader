unit main_config_env;

interface

type
  TConfigEnv = class
    class function Port: Integer;
    class function api_version: String;
  end;
implementation

{ TConfigEnv }

class function TConfigEnv.api_version: String;
begin
  Result := '/api/v1';
end;

class function TConfigEnv.Port: Integer;
begin
  Result := 9000;
end;

end.
