unit presentation_viewmodel_rankingScore;

interface

uses
  System.JSON,
  System.Generics.Collections,

  domain_usecase_last_ranking_loader;
type

  TRankingScoreViewModel = class
    class function Map(Entitie: TListRankingScore): TJSONArray;
  end;

implementation

uses
  SysUtils;

{ TRankingScoreViewModel }

class function TRankingScoreViewModel.Map(Entitie: TListRankingScore): TJSONArray;
var
  I,J: Integer;
  JsonObject: TJSONObject;
  JsonPlayer: TJSONObject;
  JsonHero  : TJSONObject;
  JsonArrayHero: TJSONArray;
begin
  Result := TJSONArray.Create;

  for I := 0 to Pred(Entitie.Count) do
  begin

    JsonObject := TJSONObject.Create;

    JsonPlayer := TJSONObject.Create;
    JsonPlayer.AddPair(TJSONPair.Create('name'   , TJSONString.Create(Entitie.Items[I].player.name)));
    JsonPlayer.AddPair(TJSONPair.Create('country', TJSONString.Create(Entitie.Items[I].player.country)));

    JsonObject.AddPair(TJSONPair.Create('player'   , JsonPlayer));
    JsonObject.AddPair(TJSONPair.Create('score'    , TJSONNumber.Create(Entitie.Items[I].score)));
    JsonObject.AddPair(TJSONPair.Create('matchDate', TJSONString.Create(FormatDateTime('dd/mm/yyyy', Entitie.Items[I].matchDate))));

    JsonArrayHero := TJSONArray.Create;
    for J := 0 to Pred(Entitie.Items[I].heroes.Count) do
    begin
      JsonHero := TJSONObject.Create;
      JsonHero.AddPair(TJSONPair.Create('name' , TJSONString.Create(Entitie.Items[I].heroes[J].name )));
      JsonHero.AddPair(TJSONPair.Create('level', TJSONNumber.Create(Entitie.Items[I].heroes[J].level)));

      JsonArrayHero.Add(JsonHero);
    end;

    JsonObject.AddPair(TJSONPair.Create('heroes', JsonArrayHero));
    Result.Add(JsonObject);
  end;

end;

end.
