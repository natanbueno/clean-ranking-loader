unit main_factorie_controller_load_last_ranking;

interface

uses
  presentation_contract_controller,
  presentation_controller_load_last_ranking,

  infra_repositorie_fake_ranking,
  data_service_last_ranking_loader;

  type makeLoadLastRankingController = class
    class function New: IController;
  end;


implementation

{ makeLoadLastRankingController }

class function makeLoadLastRankingController.New: IController;
begin
  Result := TLoadLastRankingController.New(
    TLastRankingLoaderService.New(
      TFakeRankingRepository.New
    )
  );
end;

end.
