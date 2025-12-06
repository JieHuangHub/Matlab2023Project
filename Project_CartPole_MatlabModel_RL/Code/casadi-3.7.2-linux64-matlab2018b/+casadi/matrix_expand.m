function varargout = matrix_expand(varargin)
    %MATRIX_EXPAND Expand  MX graph to SXFunction call.
    %
    %  MX = MATRIX_EXPAND(MX e, {MX} boundary, struct options)
    %  {MX} = MATRIX_EXPAND({MX} e, {MX} boundary, struct options)
    %
    %
    %Expand the given expression e, optionally supplying expressions 
    %contained 
    %in it at which expansion should stop.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_rc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L816
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L816-L820
    %
    %
  [varargout{1:nargout}] = casadiMEX(937, varargin{:});
end
