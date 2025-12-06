function varargout = shared(varargin)
    %SHARED Extract shared subexpressions from an set of expressions.
    %
    %  [{DM} OUTPUT1, {DM} OUTPUT2, {DM} OUTPUT3] = SHARED({DM} ex, char v_prefix, char v_suffix)
    %  [{SX} OUTPUT1, {SX} OUTPUT2, {SX} OUTPUT3] = SHARED({SX} ex, char v_prefix, char v_suffix)
    %  [{MX} OUTPUT1, {MX} OUTPUT2, {MX} OUTPUT3] = SHARED({MX} ex, char v_prefix, char v_suffix)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1148
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1148-L1154
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(935, varargin{:});
end
