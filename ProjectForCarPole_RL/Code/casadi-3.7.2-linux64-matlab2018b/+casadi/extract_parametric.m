function varargout = extract_parametric(varargin)
    %EXTRACT_PARAMETRIC Extract purely parametric parts from an expression graph.
    %
    %  [DM OUTPUT1, {DM} OUTPUT2, {DM} OUTPUT3] = EXTRACT_PARAMETRIC(DM expr, DM par, struct opts)
    %  [DM OUTPUT1, {DM} OUTPUT2, {DM} OUTPUT3] = EXTRACT_PARAMETRIC(DM expr, {DM} par, struct opts)
    %  [{DM} OUTPUT1, {DM} OUTPUT2, {DM} OUTPUT3] = EXTRACT_PARAMETRIC({DM} expr, DM par, struct opts)
    %  [{DM} OUTPUT1, {DM} OUTPUT2, {DM} OUTPUT3] = EXTRACT_PARAMETRIC({DM} expr, {DM} par, struct opts)
    %  [SX OUTPUT1, {SX} OUTPUT2, {SX} OUTPUT3] = EXTRACT_PARAMETRIC(SX expr, SX par, struct opts)
    %  [SX OUTPUT1, {SX} OUTPUT2, {SX} OUTPUT3] = EXTRACT_PARAMETRIC(SX expr, {SX} par, struct opts)
    %  [{SX} OUTPUT1, {SX} OUTPUT2, {SX} OUTPUT3] = EXTRACT_PARAMETRIC({SX} expr, SX par, struct opts)
    %  [{SX} OUTPUT1, {SX} OUTPUT2, {SX} OUTPUT3] = EXTRACT_PARAMETRIC({SX} expr, {SX} par, struct opts)
    %  [MX OUTPUT1, {MX} OUTPUT2, {MX} OUTPUT3] = EXTRACT_PARAMETRIC(MX expr, MX par, struct opts)
    %  [MX OUTPUT1, {MX} OUTPUT2, {MX} OUTPUT3] = EXTRACT_PARAMETRIC(MX expr, {MX} par, struct opts)
    %  [{MX} OUTPUT1, {MX} OUTPUT2, {MX} OUTPUT3] = EXTRACT_PARAMETRIC({MX} expr, MX par, struct opts)
    %  [{MX} OUTPUT1, {MX} OUTPUT2, {MX} OUTPUT3] = EXTRACT_PARAMETRIC({MX} expr, {MX} par, struct opts)
    %
    %
    %The purpose of extract_parametric is ultimately to save on evaluation 
    %time 
    %of an expression, by extracting out the parts that are only 
    %solely 
    %dependent on parameters.
    %
    %For any: [expr_ret, symbols, parametric] = extract_parametric(expr, 
    %par) It
    % holds that: substitute(expr_ret,symbols,parametric) == expr
    %
    %parametric is only dependant on par expr_ret is not dependant on par, 
    %but 
    %is dependant on symbols
    %
    %Example: [expr_ret, symbols, parametric] = 
    %
    %extract_parametric((x-sqrt(p))*y+cos(p)**2, p)
    %
    %expr_ret: (((x-extracted1)*y)+extracted2) symbols: [extracted1, 
    %extracted2]
    % parametric: [sqrt(p),cos(p)**2]
    %
    %Options to control the name of new symbols:
    %offset (int), default 0: Offset 
    %for new symbol counter
    %
    %prefix (str), default 'e_': Prefix for new symbols
    %
    %suffix (str), default '': Suffix for new symbols
    %
    %Option 'extract_trivial' controls the behaviour for extracted parts 
    %that 
    %consist of pure symbols. If false (default), these parts are not 
    %extracted.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_288
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1025
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1025-L1031
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(929, varargin{:});
end
