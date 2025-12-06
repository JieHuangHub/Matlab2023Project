function varargout = forward(varargin)
    %FORWARD Forward directional derivative.
    %
    %  {{DM}} = FORWARD({DM} ex, {DM} arg, {{DM}} v, struct opts)
    %  {{SX}} = FORWARD({SX} ex, {SX} arg, {{SX}} v, struct opts)
    %  {{MX}} = FORWARD({MX} ex, {MX} arg, {{MX}} v, struct opts)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L897
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L897-L901
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(930, varargin{:});
end
