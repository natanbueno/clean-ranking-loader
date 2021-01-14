unit domain_error_ranking_unavailable;

interface

uses
  System.SysUtils;

type

  TRankingUnavailableError = class(Exception)
  public
    constructor Create();
  end;

implementation

{ TRankingUnavailableError }

constructor TRankingUnavailableError.Create;
begin
  Self.Message := 'Ranking unavaible';
end;

end.
