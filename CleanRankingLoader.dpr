program CleanRankingLoader;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.JSON,
  Horse,
  Horse.Jhonson,
  domain_usecase_last_ranking_loader in 'src\domain\usecases\domain_usecase_last_ranking_loader.pas',
  domain_error_ranking_unavailable in 'src\domain\errors\domain_error_ranking_unavailable.pas',
  domain_entitie_rankingScore in 'src\domain\entities\domain_entitie_rankingScore.pas',
  data_model_rankingScore in 'src\data\models\data_model_rankingScore.pas',
  data_service_last_ranking_loader in 'src\data\services\data_service_last_ranking_loader.pas',
  data_contract_load_last_ranking_repository in 'src\data\contracts\data_contract_load_last_ranking_repository.pas',
  infra_repositorie_fake_ranking in 'src\infra\repositories\infra_repositorie_fake_ranking.pas',
  presentation_contract_controller in 'src\presentation\contracts\presentation_contract_controller.pas',
  presentation_contract_http in 'src\presentation\contracts\presentation_contract_http.pas',
  presentation_controller_load_last_ranking in 'src\presentation\controller\presentation_controller_load_last_ranking.pas',
  presentation_viewmodel_rankingScore in 'src\presentation\view-models\presentation_viewmodel_rankingScore.pas',
  presentation_viewmodel_server_error in 'src\presentation\view-models\presentation_viewmodel_server_error.pas',
  main_factorie_controller_load_last_ranking in 'src\main\factories\controllers\main_factorie_controller_load_last_ranking.pas',
  main_config_app in 'src\main\config\main_config_app.pas',
  main_config_env in 'src\main\config\main_config_env.pas',
  main_config_routes in 'src\main\config\main_config_routes.pas',
  main_route_ranking in 'src\main\routes\main_route_ranking.pas',
  main_server in 'src\main\main_server.pas',
  main_adapter_horse_router in 'src\main\adapters\horse-router\main_adapter_horse_router.pas',
  main_config_horse in 'src\main\config\horse\main_config_horse.pas';

begin
  try
    ReportMemoryLeaksOnShutdown := true;
    TMainServer.Run;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
