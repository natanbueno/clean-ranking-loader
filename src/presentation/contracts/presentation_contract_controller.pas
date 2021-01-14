unit presentation_contract_controller;

interface

uses
  presentation_contract_http;

type

  IController = interface
    ['{28EBB4FE-65F4-47D9-9A54-1AEBAF85C624}']
    function handle(): THttpResponse;
  end;

implementation

end.
