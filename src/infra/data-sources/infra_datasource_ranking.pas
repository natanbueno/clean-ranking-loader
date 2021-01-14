unit infra_datasource_ranking;

interface

uses
  System.JSON, System.SysUtils, System.Classes;

type

  TRankingJson = TJSONArray;

function Rankings(): TRankingJson;

implementation

function Rankings(): TRankingJson;
var
  LRankings: TJSONArray;
  LJsonString: TStringList;
begin

  LJsonString := TStringList.Create;
  try
    raise Exception.Create(GetCurrentDir);

    LJsonString.LoadFromFile(
      'C:\Desenvolvimento\clean-architecture\delphi\'+
      'clean-ranking-loader\src\infra\data-sources\ranking.json'
    );

    LRankings :=
      TJSONArray(
        TJSONObject.ParseJSONValue(
          TEncoding.ASCII.GetBytes(LJsonString.Text),0
        )
      );

    Result := LRankings;
  finally
    LJsonString.Free;
  end;
end;

end.
