function varargout = substitute(varargin)
    %SUBSTITUTE Substitute variable var with expression expr in multiple expressions.
    %
    %  DM = SUBSTITUTE(DM ex, DM v, DM vdef)
    %  {DM} = SUBSTITUTE({DM} ex, {DM} v, {DM} vdef)
    %  SX = SUBSTITUTE(SX ex, SX v, SX vdef)
    %  {SX} = SUBSTITUTE({SX} ex, {SX} v, {SX} vdef)
    %  MX = SUBSTITUTE(MX ex, MX v, MX vdef)
    %  {MX} = SUBSTITUTE({MX} ex, {MX} v, {MX} vdef)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cm
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L710
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L710-L713
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(932, varargin{:});
end
