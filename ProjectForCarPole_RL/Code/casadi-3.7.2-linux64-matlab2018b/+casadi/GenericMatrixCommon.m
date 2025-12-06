classdef  GenericMatrixCommon < SwigRef
    %GENERICMATRIXCOMMON [INTERNAL] 
    %
    %   = GENERICMATRIXCOMMON()
    %
    % Matrix base class.
    %
    %This is a common base class for  MX and Matrix<>, introducing a uniform 
    %syntax and implementing common 
    %functionality using the curiously recurring 
    %template pattern (CRTP) 
    %idiom.
    % The class is designed with the idea that 
    %"everything is a matrix",
    % that is, also scalars and vectors.
    %This 
    %philosophy makes it easy to use and to interface in particularly
    % with 
    %Python and Matlab/Octave.
    % The syntax tries to stay as close as possible to 
    %the ublas syntax 
    %when it comes to vector/matrix operations.
    % Index starts 
    %with 0.
    %Index vec happens as follows: (rr, cc) -> k = rr+cc*size1()
    %Vectors 
    %are column vectors.
    % The storage format is Compressed Column Storage (CCS), 
    %similar to 
    %that used for sparse matrices in Matlab, 
    %but unlike this 
    %format, we do allow for elements to be structurally 
    %non-zero but 
    %numerically zero.
    % The sparsity pattern, which is reference counted and 
    %cached, can be 
    %accessed with Sparsity&  sparsity()
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1am
    %
    %C++ includes: generic_matrix.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end

    function varargout = spy(self,varargin)
      [varargout{1:nargout}] = spy(sparse(casadi.DM(self.sparsity(),1)),varargin{:});
    end
    function varargout = subsref(self,s)
      if numel(s)==1 && strcmp(s.type,'()')
        [varargout{1}] = paren(self, s.subs{:});
      elseif numel(s)==1 && strcmp(s.type,'{}')
        [varargout{1}] = brace(self, s.subs{:});
      else
        [varargout{1:nargout}] = builtin('subsref',self,s);
      end
    end
    function self = subsasgn(self,s,v)
      if numel(s)==1 && strcmp(s.type,'()')
        paren_asgn(self, v, s.subs{:});
      elseif numel(s)==1 && strcmp(s.type,'{}')
        brace_asgn(self, v, s.subs{:});
      else
        self = builtin('subsasgn',self,s,v);
      end
    end
    function out = norm(self,varargin)
      narginchk(1,2);
      % 2-norm by default
      if nargin==1
        ind = 2;
      else
        ind = varargin{1};
      end
      % Typecheck
      assert((isnumeric(ind) && isscalar(ind)) || ischar(ind))
      % Pick the right norm
      if isnumeric(ind)
        switch ind
          case 1
            out = norm_1(self);
          case 2
            out = norm_2(self);
          case inf
            out = norm_inf(self);
          otherwise
            error(sprintf('Unknown norm argument: %g', ind))
        end
      else
        switch ind
          case 'fro'
            out = norm_fro(self);
          case 'inf'
            out = norm_inf(self);
          otherwise
            error(sprintf('Unknown norm argument: ''%s''', ind))
        end
      end
    end
    function out = min(varargin)
      narginchk(1,2);
      if nargin==1
        out = mmin(varargin{1});
      else
        out = fmin(varargin{1}, varargin{2});
      end
    end
    function out = max(varargin)
      narginchk(1,2);
      if nargin==1
        out = mmax(varargin{1});
      else
        out = fmax(varargin{1}, varargin{2});
      end
    end
    function b = isrow(self)
      b = is_row(self);
    end
    function b = iscolumn(self)
      b = is_column(self);
    end
    function b = isvector(self)
      b = is_vector(self);
    end
    function b = isscalar(self)
      b = is_scalar(self);
    end
      function varargout = mpower(varargin)
    %MPOWER Matrix power x^n.
    %
    %  DM = MPOWER(DM x, DM n)
    %  SX = MPOWER(SX x, SX n)
    %  MX = MPOWER(MX x, MX n)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bi
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L319
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L319-L321
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(224, varargin{:});
    end
    function varargout = mrdivide(varargin)
    %MRDIVIDE Matrix divide (cf. slash '/' in MATLAB)
    %
    %  DM = MRDIVIDE(DM x, DM y)
    %  SX = MRDIVIDE(SX x, SX y)
    %  MX = MRDIVIDE(MX x, MX y)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bl
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L376
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L376-L378
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(225, varargin{:});
    end
    function varargout = mldivide(varargin)
    %MLDIVIDE Matrix divide (cf. backslash '\\' in MATLAB)
    %
    %  DM = MLDIVIDE(DM x, DM y)
    %  SX = MLDIVIDE(SX x, SX y)
    %  MX = MLDIVIDE(MX x, MX y)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bm
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L383
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L383-L385
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(226, varargin{:});
    end
    function varargout = symvar(varargin)
    %SYMVAR Get all symbols contained in the supplied expression.
    %
    %  {DM} = SYMVAR(DM x)
    %  {SX} = SYMVAR(SX x)
    %  {MX} = SYMVAR(MX x)
    %
    %
    %Get all symbols on which the supplied expression depends 
    %See: 
    %
    %SXFunction::getFree(), MXFunction::getFree()
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bn
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L393
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L393-L395
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(227, varargin{:});
    end
    function varargout = bilin(varargin)
    %BILIN Calculate bilinear/quadratic form x^T A y.
    %
    %  DM = BILIN(DM A, DM x)
    %  SX = BILIN(SX A, SX x)
    %  MX = BILIN(MX A, MX x)
    %  DM = BILIN(DM A, DM x, DM y)
    %  SX = BILIN(SX A, SX x, SX y)
    %  MX = BILIN(MX A, MX x, MX y)
    %
    %
    %Parameters:
    %-----------
    %
    %y: 
    %can be omitted, in which case x^T A x is calculated
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bo
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L409
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(228, varargin{:});
    end
    function varargout = rank1(varargin)
    %RANK1 Make a rank-1 update to a matrix A.
    %
    %  DM = RANK1(DM A, DM alpha, DM x, DM y)
    %  SX = RANK1(SX A, SX alpha, SX x, SX y)
    %  MX = RANK1(MX A, MX alpha, MX x, MX y)
    %
    %
    %Calculates A + 1/2 * alpha * x*y'
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bp
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L422
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(229, varargin{:});
    end
    function varargout = sumsqr(varargin)
    %SUMSQR Calculate sum of squares: sum_ij X_ij^2.
    %
    %  DM = SUMSQR(DM X)
    %  SX = SUMSQR(SX X)
    %  MX = SUMSQR(MX X)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L429
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L429-L431
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(230, varargin{:});
    end
    function varargout = linspace(varargin)
    %LINSPACE Matlab's  linspace command.
    %
    %  DM = LINSPACE(DM a, DM b, int nsteps)
    %  SX = LINSPACE(SX a, SX b, int nsteps)
    %  MX = LINSPACE(MX a, MX b, int nsteps)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bt
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L460
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L460-L462
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(231, varargin{:});
    end
    function varargout = logsumexp(varargin)
    %LOGSUMEXP Scaled version of logsumexp.
    %
    %  DM = LOGSUMEXP(DM a)
    %  SX = LOGSUMEXP(SX a)
    %  MX = LOGSUMEXP(MX a)
    %  DM = LOGSUMEXP(DM a, DM margin)
    %  SX = LOGSUMEXP(SX a, SX margin)
    %  MX = LOGSUMEXP(MX a, MX margin)
    %
    %
    %Scaled such that max(x) <= logsumexp(x, margin) <= max(x)+margin
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bs
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L451
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L451-L454
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(232, varargin{:});
    end
    function varargout = interp1d(varargin)
    %INTERP1D Performs 1d linear interpolation.
    %
    %  DM = INTERP1D([double] x, DM v, [double] xq, char mode, bool equidistant)
    %  SX = INTERP1D([double] x, SX v, [double] xq, char mode, bool equidistant)
    %  MX = INTERP1D([double] x, MX v, [double] xq, char mode, bool equidistant)
    %
    %
    %The data-points to be interpolated are given as (x[i], v[i]). xq[j] is
    % used
    % as interpolating value
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L311
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L311-L314
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(233, varargin{:});
    end
    function varargout = soc(varargin)
    %SOC Construct second-order-convex.
    %
    %  DM = SOC(DM x, DM y)
    %  SX = SOC(SX x, SX y)
    %  MX = SOC(MX x, MX y)
    %
    %
    %Parameters:
    %-----------
    %
    %x: 
    %vector expression of size n
    %
    %y: 
    %scalar expression
    %
    %soc(x,y) computes [y*eye(n) x; x' y]
    %
    %soc(x,y) positive semi definite <=> || x ||_2 <= y
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bj
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L334
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L334-L336
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(234, varargin{:});
    end
    function varargout = cross(varargin)
    %CROSS Matlab's  cross command.
    %
    %  DM = CROSS(DM a, DM b, int dim)
    %  SX = CROSS(SX a, SX b, int dim)
    %  MX = CROSS(MX a, MX b, int dim)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bu
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L467
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L467-L469
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(235, varargin{:});
    end
    function varargout = skew(varargin)
    %SKEW Generate a skew symmetric matrix from a 3-vector.
    %
    %  DM = SKEW(DM a)
    %  SX = SKEW(SX a)
    %  MX = SKEW(MX a)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L474
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L474-L476
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(236, varargin{:});
    end
    function varargout = inv_skew(varargin)
    %INV_SKEW Generate the 3-vector progenitor of a skew symmetric matrix.
    %
    %  DM = INV_SKEW(DM a)
    %  SX = INV_SKEW(SX a)
    %  MX = INV_SKEW(MX a)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L481
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L481-L483
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(237, varargin{:});
    end
    function varargout = det(varargin)
    %DET Matrix determinant (experimental)
    %
    %  DM = DET(DM A)
    %  SX = DET(SX A)
    %  MX = DET(MX A)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L488
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L488-L488
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(238, varargin{:});
    end
    function varargout = inv_minor(varargin)
    %INV_MINOR Matrix inverse (experimental)
    %
    %  DM = INV_MINOR(DM A)
    %  SX = INV_MINOR(SX A)
    %  MX = INV_MINOR(MX A)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1by
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L493
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L493-L493
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(239, varargin{:});
    end
    function varargout = inv(varargin)
    %INV Matrix inverse.
    %
    %  DM = INV(DM A)
    %  SX = INV(SX A)
    %  MX = INV(MX A)
    %  DM = INV(DM A, char lsolver, struct opts)
    %  SX = INV(SX A, char lsolver, struct opts)
    %  MX = INV(MX A, char lsolver, struct opts)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L505
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L505-L509
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(240, varargin{:});
    end
    function varargout = trace(varargin)
    %TRACE Matrix trace.
    %
    %  DM = TRACE(DM a)
    %  SX = TRACE(SX a)
    %  MX = TRACE(MX a)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L514
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L514-L514
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(241, varargin{:});
    end
    function varargout = tril2symm(varargin)
    %TRIL2SYMM Convert a lower triangular matrix to a symmetric one.
    %
    %  DM = TRIL2SYMM(DM a)
    %  SX = TRIL2SYMM(SX a)
    %  MX = TRIL2SYMM(MX a)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L519
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L519-L519
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(242, varargin{:});
    end
    function varargout = triu2symm(varargin)
    %TRIU2SYMM Convert a upper triangular matrix to a symmetric one.
    %
    %  DM = TRIU2SYMM(DM a)
    %  SX = TRIU2SYMM(SX a)
    %  MX = TRIU2SYMM(MX a)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L524
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L524-L524
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(243, varargin{:});
    end
    function varargout = norm_fro(varargin)
    %NORM_FRO Frobenius norm.
    %
    %  DM = NORM_FRO(DM x)
    %  SX = NORM_FRO(SX x)
    %  MX = NORM_FRO(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L529
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L529-L529
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(244, varargin{:});
    end
    function varargout = norm_2(varargin)
    %NORM_2 2-norm
    %
    %  DM = NORM_2(DM x)
    %  SX = NORM_2(SX x)
    %  MX = NORM_2(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L534
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L534-L534
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(245, varargin{:});
    end
    function varargout = norm_1(varargin)
    %NORM_1 1-norm
    %
    %  DM = NORM_1(DM x)
    %  SX = NORM_1(SX x)
    %  MX = NORM_1(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L539
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L539-L539
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(246, varargin{:});
    end
    function varargout = norm_inf(varargin)
    %NORM_INF Infinity-norm.
    %
    %  DM = NORM_INF(DM x)
    %  SX = NORM_INF(SX x)
    %  MX = NORM_INF(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L544
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L544-L544
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(247, varargin{:});
    end
    function varargout = dot(varargin)
    %DOT Inner product of two matrices.
    %
    %  DM = DOT(DM x, DM y)
    %  SX = DOT(SX x, SX y)
    %  MX = DOT(MX x, MX y)
    %
    %
    %with x and y matrices of the same dimension
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ca
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L565
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L565-L567
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(248, varargin{:});
    end
    function varargout = nullspace(varargin)
    %NULLSPACE Computes the nullspace of a matrix A.
    %
    %  DM = NULLSPACE(DM A)
    %  SX = NULLSPACE(SX A)
    %  MX = NULLSPACE(MX A)
    %
    %
    %Finds Z m-by-(m-n) such that AZ = 0 with A n-by-m with m > n
    %
    %Assumes A is full rank
    %
    %Inspired by Numerical Methods in Scientific Computing by Ake Bjorck
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L579
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L579-L581
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(249, varargin{:});
    end
    function varargout = polyval(varargin)
    %POLYVAL Evaluate a polynomial with coefficients p in x.
    %
    %  DM = POLYVAL(DM p, DM x)
    %  SX = POLYVAL(SX p, SX x)
    %  MX = POLYVAL(MX p, MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L586
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L586-L588
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(250, varargin{:});
    end
    function varargout = diag(varargin)
    %DIAG Get the diagonal of a matrix or construct a diagonal.
    %
    %  DM = DIAG(DM A)
    %  SX = DIAG(SX A)
    %  MX = DIAG(MX A)
    %
    %
    %When the input is square, the diagonal elements are returned. If the 
    %input 
    %is vector-like, a diagonal matrix is constructed with it.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L596
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L596-L598
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(251, varargin{:});
    end
    function varargout = unite(varargin)
    %UNITE Unite two matrices no overlapping sparsity.
    %
    %  DM = UNITE(DM A, DM B)
    %  SX = UNITE(SX A, SX B)
    %  MX = UNITE(MX A, MX B)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ce
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L603
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L603-L605
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(252, varargin{:});
    end
    function varargout = densify(varargin)
    %DENSIFY Make the matrix dense and assign nonzeros to a value.
    %
    %  DM = DENSIFY(DM x)
    %  SX = DENSIFY(SX x)
    %  MX = DENSIFY(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L617
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L617-L619
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(253, varargin{:});
    end
    function varargout = project(varargin)
    %PROJECT Create a new matrix with a given sparsity pattern but with the.
    %
    %  DM = PROJECT(DM A, Sparsity sp, bool intersect)
    %  SX = PROJECT(SX A, Sparsity sp, bool intersect)
    %  MX = PROJECT(MX A, Sparsity sp, bool intersect)
    %
    %
    %nonzeros taken from an existing matrix
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ch
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L626
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L626-L629
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(254, varargin{:});
    end
    function varargout = if_else(varargin)
    %IF_ELSE Branching on  MX nodes.
    %
    %  DM = IF_ELSE(DM cond, DM if_true, DM if_false, bool short_circuit)
    %  SX = IF_ELSE(SX cond, SX if_true, SX if_false, bool short_circuit)
    %  MX = IF_ELSE(MX cond, MX if_true, MX if_false, bool short_circuit)
    %
    %
    %Ternary operator, "cond ? if_true : if_false"
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ci
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L636
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L636-L639
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(255, varargin{:});
    end
    function varargout = conditional(varargin)
    %CONDITIONAL Create a switch.
    %
    %  DM = CONDITIONAL(DM ind, {DM} x, DM x_default, bool short_circuit)
    %  SX = CONDITIONAL(SX ind, {SX} x, SX x_default, bool short_circuit)
    %  MX = CONDITIONAL(MX ind, {MX} x, MX x_default, bool short_circuit)
    %
    %
    %If the condition
    %
    %Parameters:
    %-----------
    %
    %ind: 
    %evaluates to the integer k, where 0<=k<f.size(), then x[k] will be 
    %
    %returned, otherwise
    %
    %x_default: 
    %will be returned.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cj
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L647
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L647-L650
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(256, varargin{:});
    end
    function varargout = depends_on(varargin)
    %DEPENDS_ON Check if expression depends on the argument.
    %
    %  bool = DEPENDS_ON(DM f, DM arg)
    %  bool = DEPENDS_ON(SX f, SX arg)
    %  bool = DEPENDS_ON(MX f, MX arg)
    %
    %
    %The argument must be symbolic
    %
    %The dependency is in a mathematical way: Does the value of the 
    %argument 
    %affect the value of the expression? Equivalently, will the 
    %corresponding 
    %entry of the Jacobian by a non-zero?
    %
    %The symbol could still be present in the expression graph.
    %
    %To check that kind of dependency, use contains(symvar(f),arg)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ck
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L665
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L665-L667
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(257, varargin{:});
    end
    function varargout = contains(varargin)
    %CONTAINS Check if expression n is listed in v.
    %
    %  bool = CONTAINS({DM} v, DM n)
    %  bool = CONTAINS({SX} v, SX n)
    %  bool = CONTAINS({MX} v, MX n)
    %
    %
    %This function checks for correspondence between nodes. The detection 
    %does 
    %not descend into the expression graph.
    %
    %contains({a,b},b) -> true contains({a+b},b) -> false
    %
    %e = a+b contains({e},e) -> true
    %
    %For mathematical dependency, see depends_on 
    %See: 
    % depends_on
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L685
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L685-L687
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(258, varargin{:});
    end
    function varargout = contains_all(varargin)
    %CONTAINS_ALL Check if expression n is listed in v.
    %
    %  bool = CONTAINS_ALL({DM} v, {DM} n)
    %  bool = CONTAINS_ALL({SX} v, {SX} n)
    %  bool = CONTAINS_ALL({MX} v, {MX} n)
    %
    %
    %This function checks for correspondence between nodes. The detection 
    %does 
    %not descend into the expression graph.
    %
    %contains({a,b},b) -> true contains({a+b},b) -> false
    %
    %e = a+b contains({e},e) -> true
    %
    %For mathematical dependency, see depends_on 
    %See: 
    % depends_on
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L689
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L689-L691
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(259, varargin{:});
    end
    function varargout = contains_any(varargin)
    %CONTAINS_ANY Check if expression n is listed in v.
    %
    %  bool = CONTAINS_ANY({DM} v, {DM} n)
    %  bool = CONTAINS_ANY({SX} v, {SX} n)
    %  bool = CONTAINS_ANY({MX} v, {MX} n)
    %
    %
    %This function checks for correspondence between nodes. The detection 
    %does 
    %not descend into the expression graph.
    %
    %contains({a,b},b) -> true contains({a+b},b) -> false
    %
    %e = a+b contains({e},e) -> true
    %
    %For mathematical dependency, see depends_on 
    %See: 
    % depends_on
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L693
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L693-L695
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(260, varargin{:});
    end
    function varargout = solve(varargin)
    %SOLVE Solve a system of equations: A*x = b.
    %
    %  DM = SOLVE(DM A, DM b)
    %  SX = SOLVE(SX A, SX b)
    %  MX = SOLVE(MX A, MX b)
    %  DM = SOLVE(DM A, DM b, char lsolver, struct opts)
    %  SX = SOLVE(SX A, SX b, char lsolver, struct opts)
    %  MX = SOLVE(MX A, MX b, char lsolver, struct opts)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L770
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L770-L776
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(261, varargin{:});
    end
    function varargout = pinv(varargin)
    %PINV Computes the Moore-Penrose pseudo-inverse.
    %
    %  DM = PINV(DM A)
    %  SX = PINV(SX A)
    %  MX = PINV(MX A)
    %  DM = PINV(DM A, char lsolver, struct opts)
    %  SX = PINV(SX A, char lsolver, struct opts)
    %  MX = PINV(MX A, char lsolver, struct opts)
    %
    %
    %If the matrix A is fat (size1>size2), mul(A, pinv(A)) is unity. If the
    % 
    %matrix A is slender (size2<size1), mul(pinv(A), A) is unity.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cu
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L823
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L823-L826
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(262, varargin{:});
    end
    function varargout = expm_const(varargin)
    %EXPM_CONST Calculate  Matrix exponential.
    %
    %  DM = EXPM_CONST(DM A, DM t)
    %  SX = EXPM_CONST(SX A, SX t)
    %  MX = EXPM_CONST(MX A, MX t)
    %
    %
    %Computes expm(A*t) with A constant
    %
    %Parameters:
    %-----------
    %
    %A[in]: 
    %Square matrix
    %
    %t[in]: 
    %Scalar
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_23v
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L838
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L838-L840
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(263, varargin{:});
    end
    function varargout = expm(varargin)
    %EXPM Calculate  Matrix exponential.
    %
    %  DM = EXPM(DM A)
    %  SX = EXPM(SX A)
    %  MX = EXPM(MX A)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_23w
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L846
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L846-L848
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(264, varargin{:});
    end
    function varargout = jacobian(varargin)
    %JACOBIAN Calculate Jacobian.
    %
    %  DM = JACOBIAN(DM ex, DM arg, struct opts)
    %  SX = JACOBIAN(SX ex, SX arg, struct opts)
    %  MX = JACOBIAN(MX ex, MX arg, struct opts)
    %
    %
    %Sparse matrix
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L855
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L855-L858
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(265, varargin{:});
    end
    function varargout = jtimes(varargin)
    %JTIMES Calculate the Jacobian and multiply by a vector from the right.
    %
    %  DM = JTIMES(DM ex, DM arg, DM v, bool tr, struct opts)
    %  SX = JTIMES(SX ex, SX arg, SX v, bool tr, struct opts)
    %  MX = JTIMES(MX ex, MX arg, MX v, bool tr, struct opts)
    %
    %
    %This is equivalent to  mul(jacobian(ex, arg), v) or  mul(jacobian(ex, 
    %arg).T, v) for tr set to false and true respectively. If contrast to these 
    %
    %expressions, it will use directional derivatives which is typically 
    %(but 
    %not necessarily) more efficient if the complete Jacobian is not 
    %needed and 
    %v has few rows.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L888
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L888-L891
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(266, varargin{:});
    end
    function varargout = linearize(varargin)
    %LINEARIZE Linearize an expression.
    %
    %  DM = LINEARIZE(DM f, DM x, DM x0)
    %  SX = LINEARIZE(SX f, SX x, SX x0)
    %  MX = LINEARIZE(MX f, MX x, MX x0)
    %
    %
    %[DEPRECATED] confusing behaviour
    %
    %This function linearizes an expression around a point x0, using x as 
    %delta 
    %around that point.
    %
    %
    %
    %::
    %
    %>>> linearize(sin(x),x,x0) -> sin(x0)+cos(x0)*x
    %
    %For a variant that returns sin(x0)+cos(x0)*(x-x0), see taylor.
    %
    %See: 
    %taylor,  linear_coeff
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cs
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L795
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L795-L798
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(267, varargin{:});
    end
    function varargout = which_depends(varargin)
    %WHICH_DEPENDS Find out which variables enter with some order.
    %
    %  [bool] = WHICH_DEPENDS(DM expr, DM var, int order, bool tr)
    %  [bool] = WHICH_DEPENDS(SX expr, SX var, int order, bool tr)
    %  [bool] = WHICH_DEPENDS(MX expr, MX var, int order, bool tr)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1cz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L930
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L930-L933
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(268, varargin{:});
    end
    function varargout = jacobian_sparsity(varargin)
    %JACOBIAN_SPARSITY Get the sparsity pattern of a jacobian.
    %
    %  Sparsity = JACOBIAN_SPARSITY(DM f, DM x)
    %  Sparsity = JACOBIAN_SPARSITY(SX f, SX x)
    %  Sparsity = JACOBIAN_SPARSITY(MX f, MX x)
    %
    %
    %Equivalent to, but cheaper to compute than, jacobian(f,x). sparsity()
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_259
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L940
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L940-L942
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(269, varargin{:});
    end
    function varargout = is_linear(varargin)
    %IS_LINEAR Is expr linear in var?
    %
    %  bool = IS_LINEAR(DM expr, DM var)
    %  bool = IS_LINEAR(SX expr, SX var)
    %  bool = IS_LINEAR(MX expr, MX var)
    %
    %
    %False negatives are possible (an expression may not be recognised as 
    %linear
    % while it really is), false positives not.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L951
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L951-L953
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(270, varargin{:});
    end
    function varargout = is_quadratic(varargin)
    %IS_QUADRATIC Is expr quadratic in var?
    %
    %  bool = IS_QUADRATIC(DM expr, DM var)
    %  bool = IS_QUADRATIC(SX expr, SX var)
    %  bool = IS_QUADRATIC(MX expr, MX var)
    %
    %
    %False negatives are possible (an expression may not be recognised as 
    %
    %quadratic while it really is), false positives not.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L962
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L962-L964
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(271, varargin{:});
    end
    function varargout = gradient(varargin)
    %GRADIENT Calculate the gradient of an expression.
    %
    %  DM = GRADIENT(DM ex, DM arg, struct opts)
    %  SX = GRADIENT(SX ex, SX arg, struct opts)
    %  MX = GRADIENT(MX ex, MX arg, struct opts)
    %
    %
    %Parameters:
    %-----------
    %
    %ex[in]: 
    %Scalar expression to take the gradient of
    %
    %arg[in]: 
    %Vector expression of symbols
    %
    %opts[in]: 
    %Options
    %
    %Dense column vector
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_23x
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L868
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L868-L870
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(272, varargin{:});
    end
    function varargout = tangent(varargin)
    %TANGENT Calculate the tangent of an expression.
    %
    %  DM = TANGENT(DM ex, DM arg, struct opts)
    %  SX = TANGENT(SX ex, SX arg, struct opts)
    %  MX = TANGENT(MX ex, MX arg, struct opts)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_23y
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L875
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L875-L877
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(273, varargin{:});
    end
    function varargout = hessian(varargin)
    %HESSIAN Hessian and (optionally) gradient.
    %
    %  [DM , DM OUTPUT1] = HESSIAN(DM ex, DM arg, struct opts)
    %  [SX , SX OUTPUT1] = HESSIAN(SX ex, SX arg, struct opts)
    %  [MX , MX OUTPUT1] = HESSIAN(MX ex, MX arg, struct opts)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_23z
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L921
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L921-L924
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(274, varargin{:});
    end
    function varargout = quadratic_coeff(varargin)
    %QUADRATIC_COEFF Recognizes quadratic form in scalar expression.
    %
    %  [DM OUTPUT1, DM OUTPUT2, DM OUTPUT3] = QUADRATIC_COEFF(DM ex, DM arg, bool check)
    %  [SX OUTPUT1, SX OUTPUT2, SX OUTPUT3] = QUADRATIC_COEFF(SX ex, SX arg, bool check)
    %  [MX OUTPUT1, MX OUTPUT2, MX OUTPUT3] = QUADRATIC_COEFF(MX ex, MX arg, bool check)
    %
    %
    %1/2*x' A x + b' x + c
    %
    %e = 0.5*bilin(A,x,x)+dot(b,x)+c
    %
    %Parameters:
    %-----------
    %
    %check[in]: 
    %When true (default), A is checked to be independent of x. 
    %Provided to 
    %deal with false positive dependency checks.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L976
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L976-L979
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(275, varargin{:});
    end
    function varargout = linear_coeff(varargin)
    %LINEAR_COEFF Recognizes linear form in vector expression.
    %
    %  [DM OUTPUT1, DM OUTPUT2] = LINEAR_COEFF(DM ex, DM arg, bool check)
    %  [SX OUTPUT1, SX OUTPUT2] = LINEAR_COEFF(SX ex, SX arg, bool check)
    %  [MX OUTPUT1, MX OUTPUT2] = LINEAR_COEFF(MX ex, MX arg, bool check)
    %
    %
    %A x + b
    %
    %Parameters:
    %-----------
    %
    %check[in]: 
    %When true (default)m, A is checked to be independent of x. 
    %Provided to
    % deal with false positive dependency checks.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L989
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L989-L992
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(276, varargin{:});
    end
    function varargout = n_nodes(varargin)
    %N_NODES 
    %
    %  int = N_NODES(DM A)
    %  int = N_NODES(SX A)
    %  int = N_NODES(MX A)
    %
    %
     [varargout{1:nargout}] = casadiMEX(277, varargin{:});
    end
    function varargout = print_operator(varargin)
    %PRINT_OPERATOR Get a string representation for a binary MatType, using custom 
    %
    %  char = PRINT_OPERATOR(DM xb, {char} args)
    %  char = PRINT_OPERATOR(SX xb, {char} args)
    %  char = PRINT_OPERATOR(MX xb, {char} args)
    %
    %arguments.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1131
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1131-L1133
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(278, varargin{:});
    end
    function varargout = repsum(varargin)
    %REPSUM Given a repeated matrix, computes the sum of repeated parts.
    %
    %  DM = REPSUM(DM A, int n, int m)
    %  SX = REPSUM(SX A, int n, int m)
    %  MX = REPSUM(MX A, int n, int m)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1159
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1159-L1161
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(279, varargin{:});
    end
    function varargout = diff(varargin)
    %DIFF Returns difference (n-th order) along given axis (MATLAB convention)
    %
    %  DM = DIFF(DM A, int n, index axis)
    %  SX = DIFF(SX A, int n, index axis)
    %  MX = DIFF(MX A, int n, index axis)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L549
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L549-L551
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(280, varargin{:});
    end
    function varargout = cumsum(varargin)
    %CUMSUM Returns cumulative sum along given axis (MATLAB convention)
    %
    %  DM = CUMSUM(DM A, index axis)
    %  SX = CUMSUM(SX A, index axis)
    %  MX = CUMSUM(MX A, index axis)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L556
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L556-L558
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(281, varargin{:});
    end
    function varargout = einstein(varargin)
    %EINSTEIN Compute any contraction of two dense tensors, using index/einstein 
    %
    %  DM = EINSTEIN(DM A, DM B, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %  SX = EINSTEIN(SX A, SX B, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %  MX = EINSTEIN(MX A, MX B, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %  DM = EINSTEIN(DM A, DM B, DM C, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %  SX = EINSTEIN(SX A, SX B, SX C, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %  MX = EINSTEIN(MX A, MX B, MX C, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %
    %
    %notation.
    %
    %einstein(A, B, a, b, c) -> C
    %
    %Given two tensors, A and B, computes a third tensor C such that:
    %
    %C_c = A_a * B_b
    %
    %With a, b, c representing einstein indices. Instead of the classical 
    %index 
    %labels i,j,k,... we employ -1,-2,-3,...
    %
    %A, B, C are represented as CasADi vectors, with dim_a, dim_b, dim_c 
    %
    %indictating theire tensorial dimensions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1bk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L364
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L364-L370
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(282, varargin{:});
    end
    function varargout = mmin(varargin)
    %MMIN Smallest element in a matrix.
    %
    %  DM = MMIN(DM x)
    %  SX = MMIN(SX x)
    %  MX = MMIN(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1167
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1167-L1169
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(283, varargin{:});
    end
    function varargout = mmax(varargin)
    %MMAX Largest element in a matrix.
    %
    %  DM = MMAX(DM x)
    %  SX = MMAX(SX x)
    %  MX = MMAX(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1176
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1176-L1178
    %
    %
    %
     [varargout{1:nargout}] = casadiMEX(284, varargin{:});
    end
    function varargout = evalf(varargin)
    %EVALF 
    %
    %  DM = EVALF(DM x)
    %  DM = EVALF(SX x)
    %  DM = EVALF(MX x)
    %
    %
     [varargout{1:nargout}] = casadiMEX(285, varargin{:});
    end
    function varargout = separate_linear(varargin)
    %SEPARATE_LINEAR 
    %
    %  [DM OUTPUT1, DM OUTPUT2, DM OUTPUT3] = SEPARATE_LINEAR(DM expr, DM sym_lin, DM sym_const)
    %  [DM OUTPUT1, DM OUTPUT2, DM OUTPUT3] = SEPARATE_LINEAR(DM expr, {DM} sym_lin, {DM} sym_const)
    %  [SX OUTPUT1, SX OUTPUT2, SX OUTPUT3] = SEPARATE_LINEAR(SX expr, SX sym_lin, SX sym_const)
    %  [SX OUTPUT1, SX OUTPUT2, SX OUTPUT3] = SEPARATE_LINEAR(SX expr, {SX} sym_lin, {SX} sym_const)
    %  [MX OUTPUT1, MX OUTPUT2, MX OUTPUT3] = SEPARATE_LINEAR(MX expr, MX sym_lin, MX sym_const)
    %  [MX OUTPUT1, MX OUTPUT2, MX OUTPUT3] = SEPARATE_LINEAR(MX expr, {MX} sym_lin, {MX} sym_const)
    %
    %
     [varargout{1:nargout}] = casadiMEX(286, varargin{:});
    end
    function self = GenericMatrixCommon(varargin)
    %GENERICMATRIXCOMMON 
    %
    %  new_obj = GENERICMATRIXCOMMON()
    %
    %
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(287, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(288, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
