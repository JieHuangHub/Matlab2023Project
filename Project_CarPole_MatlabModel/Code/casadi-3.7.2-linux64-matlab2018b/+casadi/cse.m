function varargout = cse(varargin)
    %CSE Common subexpression elimination.
    %
    %  DM = CSE(DM e)
    %  {DM} = CSE({DM} e)
    %  {SX} = CSE({SX} e)
    %  SX = CSE(SX e)
    %  MX = CSE(MX e)
    %  {MX} = CSE({MX} e)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cp
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L739
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L739-L741
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(928, varargin{:});
end
