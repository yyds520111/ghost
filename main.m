#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <dlfcn.h>
#import <math.h>
#import <string.h>

typedef void V;
typedef void I;
typedef struct { V* K; V* M; } H;
typedef struct { H h; int l; unsigned short c[1]; } S;
typedef struct { H h; void* B; unsigned long M; void* V[1]; } A;
typedef struct { float x, y, z; } V3;

static I* (*g0)(void);
static I* (*g1)(I*, size_t*);
static I* (*g2)(I*);
static size_t (*g3)(I*);
static I* (*g4)(I*, size_t);
static const char* (*g5)(I*);
static const char* (*g6)(I*);
static I* (*g7)(I*);
static I* (*g8)(I*, const char*, int);
static I* (*g9)(I*, void*, void**, I**);
static void* (*gA)(I*);
static I* (*gB)(I*);
static I* (*gC)(I*, const char*, const char*);
static int G;

#define INV(m,s,args) g9((m),(s),(args),(I**)0)

static void L(void) {
    if (G) return;
    void* h = dlopen("@executable_path/Frameworks/UnityFramework.framework/UnityFramework", RTLD_NOW);
    if (!h) h = dlopen("UnityFramework", RTLD_NOW);
    if (!h) h = RTLD_DEFAULT;
#define B(v,n) *(void**)&(v) = dlsym(h, n)
    B(g0, "il2cpp_domain_get");
    B(g1, "il2cpp_domain_get_assemblies");
    B(g2, "il2cpp_assembly_get_image");
    B(g3, "il2cpp_image_get_class_count");
    B(g4, "il2cpp_image_get_class");
    B(g5, "il2cpp_class_get_name");
    B(g6, "il2cpp_class_get_namespace");
    B(g7, "il2cpp_class_get_parent");
    B(g8, "il2cpp_class_get_method_from_name");
    B(g9, "il2cpp_runtime_invoke");
    B(gA, "il2cpp_thread_attach");
    B(gB, "il2cpp_class_get_type");
    B(gC, "il2cpp_class_from_name");
#undef B
    if (!g0 || !g9) return;
    if (gA) gA(g0());
    G = 1;
}

static I* C(const char* n, const char* K) {
    if (!G) return 0;
    size_t N = 0;
    I** As = g1(g0(), &N);
    for (size_t i = 0; i < N; i++) {
        I* K2 = gC(g2(As[i]), n, K);
        if (K2) return K2;
    }
    return 0;
}

static V3 V3b(I* b) { V3 v = {0}; if (b) memcpy(&v, (char*)b + 16, 12); return v; }
static float Fb(I* b) { float f = 0; if (b) memcpy(&f, (char*)b + 16, 4); return f; }
static int Ib(I* b) { int i = 0; if (b) memcpy(&i, (char*)b + 16, 4); return i; }

static NSString* Ms(S* s) {
    if (!s || !s->h.K) return @"";
    int n = s->l;
    if (n < 1 || n > 512) return @"";
    unichar* u = malloc(2 * n);
    memcpy(u, s->c, 2 * n);
    NSString* r = [NSString stringWithCharacters:u length:n];
    free(u);
    return r ?: @"";
}

typedef NS_ENUM(int, EC) { EC0 = 0, ECG, ECI, ECP, ECC };
@interface CE : NSObject
@property (nonatomic, assign) void* K;
@property (nonatomic, copy) NSString* n;
@property (nonatomic, copy) NSString* s;
@property (nonatomic, assign) EC e;
@end
@implementation CE
@end

static NSArray<CE*>* gC;

static NSArray* Bl(void) {
    static NSArray* a;
    if (a) return a;
    a = @[@"UnityEngine", @"Unity.", @"System", @"TMPro", @"Mono", @"Microsoft",
          @"Newtonsoft", @"AWS", @"Amazon", @"Google", @"AppleAuth", @"Cinemachine",
          @"log4net", @"Photon", @"Dissonance", @"Lean", @"CW.", @"PaintIn3D",
          @"Parabox", @"NavMesh", @"Whinarn", @"SSCC", @"SeppePeelman", @"Purchasing",
          @"__Generated", @"Frida", @"Il2Cpp", @"AD_"];
    return a;
}

static BOOL Bn(NSString* n) {
    for (NSString* p in Bl()) if ([n hasPrefix:p]) return YES;
    return NO;
}

static BOOL MBM(I* K) {
    I* c2 = K;
    for (int d = 0; c2 && d < 24; d++) {
        const char* n = g5(c2);
        if (n && !strcmp(n, "MonoBehaviour")) return YES;
        c2 = g7(c2);
    }
    return NO;
}

static EC Cls(NSString* n, NSString* s) {
    NSString* l = n.lowercaseString;
    NSString* L = s.lowercaseString;
    if ([l containsString:@"editor"]) return EC0;
    if ([l containsString:@"camera"] || [L containsString:@"camera"]) return ECC;
    if ([l containsString:@"ghost"] || [l containsString:@"spirit"] ||
        [l containsString:@"phantom"] || [l containsString:@"wraith"] ||
        [l containsString:@"poltergeist"] || [l containsString:@"specter"] ||
        [l containsString:@"haunt"] || [l containsString:@"monster"] ||
        [l containsString:@"demon"] || [l containsString:@"entity"]) return ECG;
    if ([l containsString:@"item"] || [l containsString:@"pickup"] ||
        [l containsString:@"evidence"] || [l containsString:@"collect"] ||
        [l containsString:@"loot"] || [l containsString:@"clue"]) return ECI;
    if ([l containsString:@"player"] || [l containsString:@"character"] ||
        [l containsString:@"avatar"]) return ECP;
    return EC0;
}

static void Scan(void) {
    if (!G) return;
    NSMutableArray* O = [NSMutableArray array];
    size_t N = 0;
    I** As = g1(g0(), &N);
    for (size_t a = 0; a < N; a++) {
        I* im = g2(As[a]);
        if (!im) continue;
        size_t cc = g3(im);
        for (size_t i = 0; i < cc; i++) {
            I* K = g4(im, i);
            if (!K) continue;
            const char* nmC = g5(K);
            const char* nsC = g6(K);
            if (!nmC) continue;
            NSString* n = [NSString stringWithUTF8String:nmC];
            NSString* s = nsC ? [NSString stringWithUTF8String:nsC] : @"";
            if (!n.length || [n hasPrefix:@"<"]) continue;
            if (Bn(s)) continue;
            if (!MBM(K)) continue;
            EC e = Cls(n, s);
            if (e == EC0) continue;
            CE* E = [CE new];
            E.K = K;
            E.n = n;
            E.s = s;
            E.e = e;
            [O addObject:E];
        }
    }
    gC = O;
    NSLog(@"[G] scan=%lu", (unsigned long)O.count);
}

static A* FI(I* K) {
    static I* oK;
    static I *mF, *mA;
    if (!oK) {
        oK = C("UnityEngine", "Object");
        if (oK) {
            mF = g8(oK, "FindObjectsOfType", 1);
            mA = g8(oK, "FindObjectsOfTypeAll", 1);
        }
    }
    if (!oK || !K) return 0;
    I* t = gB(K);
    void* args[1] = { &t };
    A* r = 0;
    if (mF) r = (A*)INV(mF, 0, args);
    if ((!r || !r->M) && mA) r = (A*)INV(mA, 0, args);
    return (r && r->M) ? r : 0;
}

static void* GT(void* o) {
    static I* m;
    if (!m) {
        I* c2 = C("UnityEngine", "Component");
        if (c2) m = g8(c2, "get_transform", 0);
    }
    return (m && o) ? INV(m, o, 0) : 0;
}
static I* TM(const char* n, int a) {
    static I* tk;
    if (!tk) tk = C("UnityEngine", "Transform");
    return tk ? g8(tk, n, a) : 0;
}

static V3 P(void* t) { I* m = TM("get_position", 0); return (m && t) ? V3b(INV(m, t, 0)) : (V3){0}; }
static V3 F(void* t) { I* m = TM("get_forward", 0); return (m && t) ? V3b(INV(m, t, 0)) : (V3){0,0,1}; }
static V3 U(void* t) { I* m = TM("get_up", 0); return (m && t) ? V3b(INV(m, t, 0)) : (V3){0,1,0}; }
static int CCnt(void* t) { I* m = TM("get_childCount", 0); return (m && t) ? Ib(INV(m, t, 0)) : 0; }
static void* Ch(void* t, int i) {
    I* m = TM("GetChild", 1);
    if (!m || !t) return 0;
    void* a = (void*)(long)i;
    void* args[1] = { &a };
    return INV(m, t, args);
}
static NSString* N(void* o) {
    static I* m;
    if (!m) {
        I* k = C("UnityEngine", "Object");
        if (k) m = g8(k, "get_name", 0);
    }
    return (m && o) ? Ms((S*)INV(m, o, 0)) : @"";
}

@interface CS : NSObject
@property (nonatomic, assign) V3 p;
@property (nonatomic, assign) V3 f;
@property (nonatomic, assign) V3 u;
@property (nonatomic, assign) float fv;
@property (nonatomic, assign) float as;
@property (nonatomic, assign) float zn;
@property (nonatomic, assign) float zf;
@property (nonatomic, assign) BOOL ok;
@end
@implementation CS
@end

static void* RRC(void) {
    I* K = C("Cinemachine", "CinemachineBrain");
    if (!K) K = C("Unity.Cinemachine", "CinemachineBrain");
    if (K) {
        I* ok = C("UnityEngine", "Object");
        if (ok) {
            I* m = g8(ok, "FindObjectOfType", 1);
            if (m) {
                I* t = gB(K);
                void* args[1] = { &t };
                void* b = INV(m, 0, args);
                if (b) {
                    I* gg = g8(K, "get_OutputCamera", 0);
                    if (gg) {
                        void* cam = INV(gg, b, 0);
                        if (cam) return cam;
                    }
                }
            }
        }
    }
    I* ck = C("UnityEngine", "Camera");
    I* m = ck ? g8(ck, "get_main", 0) : 0;
    return m ? INV(m, 0, 0) : 0;
}

static CS* RC(void) {
    CS* c = [CS new];
    c.fv = 60; c.as = 1; c.zn = .1f; c.zf = 2000;
    I* ck = C("UnityEngine", "Camera");
    if (!ck) return c;
    void* cam = RRC();
    if (!cam) return c;
    void* t = GT(cam);
    if (t) { c.p = P(t); c.f = F(t); c.u = U(t); }
    I* m;
    if ((m = g8(ck, "get_fieldOfView", 0))) c.fv = Fb(INV(m, cam, 0));
    if ((m = g8(ck, "get_aspect", 0))) c.as = Fb(INV(m, cam, 0));
    if ((m = g8(ck, "get_nearClipPlane", 0))) c.zn = Fb(INV(m, cam, 0));
    if ((m = g8(ck, "get_farClipPlane", 0))) c.zf = Fb(INV(m, cam, 0));
    if (c.as < .01f) {
        CGSize s = UIScreen.mainScreen.bounds.size;
        c.as = (float)(s.width / s.height);
    }
    c.ok = YES;
    return c;
}

typedef struct { float m[16]; } M4;

static M4 Mul(const M4* a, const M4* b) {
    M4 r; memset(&r, 0, 64);
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++) {
            float s = 0;
            for (int k = 0; k < 4; k++) s += a->m[k*4+i] * b->m[j*4+k];
            r.m[j*4+i] = s;
        }
    return r;
}

static V3 X(V3 a, V3 b) { return (V3){a.y*b.z - a.z*b.y, a.z*b.x - a.x*b.z, a.x*b.y - a.y*b.x}; }

static V3 Nm(V3 a) {
    float l = sqrtf(a.x*a.x + a.y*a.y + a.z*a.z);
    if (l < 1e-6f) return (V3){0,0,1};
    return (V3){a.x/l, a.y/l, a.z/l};
}
static M4 Vw(CS* c) {
    V3 f = Nm(c->f), u = Nm(c->u), r = Nm(X(u, f));
    u = X(f, r);
    M4 v;
    v.m[0]=r.x; v.m[1]=u.x; v.m[2]=-f.x; v.m[3]=0;
    v.m[4]=r.y; v.m[5]=u.y; v.m[6]=-f.y; v.m[7]=0;
    v.m[8]=r.z; v.m[9]=u.z; v.m[10]=-f.z; v.m[11]=0;
    v.m[12]=-(r.x*c->p.x + r.y*c->p.y + r.z*c->p.z);
    v.m[13]=-(u.x*c->p.x + u.y*c->p.y + u.z*c->p.z);
    v.m[14]=f.x*c->p.x + f.y*c->p.y + f.z*c->p.z;
    v.m[15]=1;
    return v;
}

static M4 Pj(CS* c) {
    float as = c->as > .01f ? c->as : 1;
    float f = 1 / tanf(c->fv * M_PI / 360);
    M4 p; memset(&p, 0, 64);
    p.m[0] = f / as;
    p.m[5] = f;
    p.m[10] = (c->zf + c->zn) / (c->zn - c->zf);
    p.m[11] = -1;
    p.m[14] = (2 * c->zf * c->zn) / (c->zn - c->zf);
    p.m[15] = 0;
    return p;
}

static BOOL W2S(M4* v, V3 w, CGPoint* o, CGSize s) {
    float x = v->m[0]*w.x + v->m[4]*w.y + v->m[8]*w.z + v->m[12];
    float y = v->m[1]*w.x + v->m[5]*w.y + v->m[9]*w.z + v->m[13];
    float cw2 = v->m[3]*w.x + v->m[7]*w.y + v->m[11]*w.z + v->m[15];
    if (cw2 < .02f) return NO;
    float nx = x / cw2, ny = y / cw2;
    if (nx < -1.3f || nx > 1.3f || ny < -1.3f || ny > 1.3f) return NO;
    o->x = (nx * .5f + .5f) * s.width;
    o->y = s.height - (ny * .5f + .5f) * s.height;
    return YES;
}

static BOOL eG=YES, eI=YES, eS=YES, eB=NO, eL=YES, eN=NO;
static CGFloat mD = 80, wL = 1.6f;

static NSArray* BW(void) {
    static NSArray* a;
    if (a) return a;
    a = @[@"head", @"neck", @"chest", @"spine", @"hip", @"pelvis", @"shoulder",
          @"clavicle", @"elbow", @"forearm", @"hand", @"wrist", @"thigh",
          @"upleg", @"knee", @"calf", @"shin", @"foot", @"ankle", @"bip", @"mixamorig"];
    return a;
}

static BOOL IsB(NSString* n) {
    NSString* l = n.lowercaseString;
    for (NSString* w in BW()) if ([l containsString:w]) return YES;
    return NO;
}

typedef struct { void* a, *b; } BE;

static void CollB(void* t, int d, BE* e, int* c, int cap) {
    if (!t || d > 8 || *c >= cap) return;
    int cc = CCnt(t);
    for (int i = 0; i < cc && *c < cap; i++) {
        void* ch = Ch(t, i);
        if (!ch) continue;
        if (IsB(N(ch))) { e[*c].a = t; e[*c].b = ch; (*c)++; }
        CollB(ch, d + 1, e, c, cap);
    }
}

@interface ECV : UIView
@property (nonatomic, strong) CADisplayLink* lnk;
@property (nonatomic, strong) NSArray<CE*>* gE;
@property (nonatomic, strong) NSArray<CE*>* iE;
@property (nonatomic, assign) CFAbsoluteTime lS;
@property (nonatomic, assign) CFAbsoluteTime lI;
@property (nonatomic, strong) NSMutableArray* gI;
@property (nonatomic, strong) NSMutableArray* iI;
@end

@implementation ECV

- (void)tick { [self setNeedsDisplay]; }

- (void)rc {
    CFAbsoluteTime n = CFAbsoluteTimeGetCurrent();
    if (self.gE && n - self.lS < 8) return;
    if (!gC) Scan();
    NSMutableArray* g = [NSMutableArray array];
    NSMutableArray* it = [NSMutableArray array];
    for (CE* e in gC) {
        if (e.e == ECG || e.e == ECP) [g addObject:e];
        else if (e.e == ECI) [it addObject:e];
    }
    self.gE = g;
    self.iE = it;
    self.lS = n;
}
- (void)ri {
    CFAbsoluteTime n = CFAbsoluteTimeGetCurrent();
    if (self.gI && n - self.lI < .2) return;
    NSMutableArray* g = [NSMutableArray array];
    NSMutableArray* it = [NSMutableArray array];
    for (CE* e in self.gE) {
        A* a = FI(e.K);
        if (!a) continue;
        for (size_t i = 0; i < a->M && i < 128; i++) {
            void* o = a->V[i];
            if (o) [g addObject:@[[NSValue valueWithPointer:o], e]];
        }
    }
    for (CE* e in self.iE) {
        A* a = FI(e.K);
        if (!a) continue;
        for (size_t i = 0; i < a->M && i < 256; i++) {
            void* o = a->V[i];
            if (o) [it addObject:@[[NSValue valueWithPointer:o], e]];
        }
    }
    self.gI = g;
    self.iI = it;
    self.lI = n;
}

- (void)drawRect:(CGRect)r {
    if (!G) return;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (!ctx) return;
    [self rc];
    [self ri];
    CS* cam = RC();
    if (!cam.ok) return;
    M4 vw = Vw(cam), pj = Pj(cam), vp = Mul(&pj, &vw);
    CGSize sc = self.bounds.size;

    if (eG) for (NSArray* pr in self.gI) {
        void* obj = ((NSValue*)pr[0]).pointerValue;
        CE* e = pr[1];
        void* t = GT(obj);
        if (!t) continue;
        V3 w = P(t);
        float dx = w.x - cam.p.x, dy = w.y - cam.p.y, dz = w.z - cam.p.z;
        float d = sqrtf(dx*dx + dy*dy + dz*dz);
        if (d > mD || d < .3) continue;
        CGPoint ft;
        if (!W2S(&vp, w, &ft, sc)) continue;
        CGPoint hd;
        BOOL hh = W2S(&vp, (V3){w.x, w.y + 1.75f, w.z}, &hd, sc);
        UIColor* col = e.e == ECP ? UIColor.systemGreenColor : UIColor.systemRedColor;

        if (eL) {
            NSString* n = N(obj);
            if (!n.length) n = e.n;
            NSString* l = [NSString stringWithFormat:@"%@  %.0fm", n, d];
            [l drawAtPoint:CGPointMake(ft.x + 4, (hh ? hd.y : ft.y) - 16)
            withAttributes:@{NSFontAttributeName:[UIFont monospacedSystemFontOfSize:11 weight:UIFontWeightBold],
                             NSForegroundColorAttributeName:col}];
        }
        if (eB && hh) {
            CGFloat h = ft.y - hd.y;
            if (h < 8) h = 40;
            CGFloat w2 = h * .42;
            CGContextSetStrokeColorWithColor(ctx, col.CGColor);
            CGContextSetLineWidth(ctx, wL);
            CGContextStrokeRect(ctx, CGRectMake(ft.x - w2 * .5, hd.y, w2, h));
        }
        if (eN) {
            CGContextSetStrokeColorWithColor(ctx, col.CGColor);
            CGContextSetLineWidth(ctx, wL * .7);
            CGContextMoveToPoint(ctx, sc.width * .5, sc.height);
            CGContextAddLineToPoint(ctx, ft.x, ft.y);
            CGContextStrokePath(ctx);
        }
        if (eS) {
            BE ed[192];
            int ec = 0;
            CollB(t, 0, ed, &ec, 192);
            CGContextSetLineWidth(ctx, wL);
            for (int k = 0; k < ec; k++) {
                CGPoint a2, b2;
                if (!W2S(&vp, P(ed[k].a), &a2, sc)) continue;
                if (!W2S(&vp, P(ed[k].b), &b2, sc)) continue;
                if (fabs(a2.x - b2.x) < 1 && fabs(a2.y - b2.y) < 1) continue;
                CGContextSetStrokeColorWithColor(ctx, col.CGColor);
                CGContextMoveToPoint(ctx, a2.x, a2.y);
                CGContextAddLineToPoint(ctx, b2.x, b2.y);
                CGContextStrokePath(ctx);
            }
        }
    }
        if (eI) for (NSArray* pr in self.iI) {
        void* obj = ((NSValue*)pr[0]).pointerValue;
        CE* e = pr[1];
        void* t = GT(obj);
        if (!t) continue;
        V3 w = P(t);
        float dx = w.x - cam.p.x, dy = w.y - cam.p.y, dz = w.z - cam.p.z;
        float d = sqrtf(dx*dx + dy*dy + dz*dz);
        if (d > mD) continue;
        CGPoint sp;
        if (!W2S(&vp, w, &sp, sc)) continue;
        CGContextSetFillColorWithColor(ctx, UIColor.systemYellowColor.CGColor);
        CGContextFillEllipseInRect(ctx, CGRectMake(sp.x - 3.5, sp.y - 3.5, 7, 7));
        if (eL) {
            NSString* n = N(obj);
            if (!n.length) n = e.n;
            [[NSString stringWithFormat:@"%@ %.0fm", n, d]
             drawAtPoint:CGPointMake(sp.x + 7, sp.y - 7)
             withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10 weight:UIFontWeightSemibold],
                              NSForegroundColorAttributeName:UIColor.systemYellowColor}];
        }
    }
}
@end

static UIWindowScene* AS(void) {
    for (UIScene* s in UIApplication.sharedApplication.connectedScenes)
        if ([s isKindOfClass:UIWindowScene.class]) return (UIWindowScene*)s;
    return 0;
}

@interface Menu : UIWindow
@property (nonatomic, strong) UIView* panel;
@property (nonatomic, strong) UIView* fab;
@end

@implementation Menu

- (UIView*)hitTest:(CGPoint)p withEvent:(UIEvent*)e {
    UIView* v = [super hitTest:p withEvent:e];
    if (v == self.rootViewController.view) return nil;
    return v;
}

- (void)build {
    self.backgroundColor = UIColor.clearColor;
    UIViewController* vc = [UIViewController new];
    vc.view.backgroundColor = UIColor.clearColor;
    self.rootViewController = vc;

    self.fab = [UIButton buttonWithType:UIButtonTypeSystem];
    self.fab.frame = CGRectMake(14, 140, 48, 48);
    self.fab.backgroundColor = [UIColor colorWithWhite:0 alpha:.36];
    self.fab.layer.cornerRadius = 24;
    self.fab.layer.cornerCurve = kCACornerCurveContinuous;
    [self.fab setImage:[UIImage systemImageNamed:@"ghost.fill"] forState:UIControlStateNormal];
    self.fab.tintColor = UIColor.whiteColor;
    [self.fab addTarget:self action:@selector(tg) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:self.fab];
    [self.fab addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dg:)]];

    UIVisualEffectView* bg = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialDark]];
    bg.layer.cornerRadius = 18;
    bg.layer.cornerCurve = kCACornerCurveContinuous;
    bg.clipsToBounds = YES;

    CGFloat W = 248, H = 460;
    self.panel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W, H)];
    self.panel.center = CGPointMake(UIScreen.mainScreen.bounds.size.width * .5,
                                    UIScreen.mainScreen.bounds.size.height * .5);
    bg.frame = self.panel.bounds;
    bg.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.panel addSubview:bg];

    UIStackView* st = [[UIStackView alloc] initWithFrame:CGRectInset(self.panel.bounds, 16, 16)];
    st.axis = UILayoutConstraintAxisVertical;
    st.spacing = 8;
    [self.panel addSubview:st];

    UILabel* tt = [UILabel new];
    tt.text = @"The Ghost";
    tt.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    tt.textColor = UIColor.whiteColor;
    [st addArrangedSubview:tt];
        [st addArrangedSubview:[self row:@"鬼 ESP" sel:@selector(sG:) on:eG]];
    [st addArrangedSubview:[self row:@"物品 ESP" sel:@selector(sI:) on:eI]];
    [st addArrangedSubview:[self row:@"骨骼" sel:@selector(sS:) on:eS]];
    [st addArrangedSubview:[self row:@"2D 方框" sel:@selector(sB:) on:eB]];
    [st addArrangedSubview:[self row:@"名称 / 距离" sel:@selector(sL:) on:eL]];
    [st addArrangedSubview:[self row:@"屏幕连线" sel:@selector(sN:) on:eN]];

    UILabel* dl = [UILabel new];
    dl.tag = 901;
    dl.text = [NSString stringWithFormat:@"最大距离 %.0f m", mD];
    dl.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    dl.textColor = [UIColor colorWithWhite:1 alpha:.72];
    [st addArrangedSubview:dl];

    UISlider* sl = [UISlider new];
    sl.minimumValue = 10;
    sl.maximumValue = 300;
    sl.value = mD;
    sl.tintColor = UIColor.systemBlueColor;
    [sl addTarget:self action:@selector(di:) forControlEvents:UIControlEventValueChanged];
    sl.translatesAutoresizingMaskIntoConstraints = NO;
    [st addArrangedSubview:sl];
    [sl.heightAnchor constraintEqualToConstant:28].active = YES;

    UIButton* ex = [UIButton buttonWithType:UIButtonTypeSystem];
    [ex setTitle:@"导出类清单" forState:UIControlStateNormal];
    ex.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
    ex.backgroundColor = [UIColor colorWithWhite:1 alpha:.12];
    ex.layer.cornerRadius = 9;
    ex.layer.cornerCurve = kCACornerCurveContinuous;
    ex.tintColor = UIColor.whiteColor;
    [ex addTarget:self action:@selector(ex) forControlEvents:UIControlEventTouchUpInside];
    ex.translatesAutoresizingMaskIntoConstraints = NO;
    [st addArrangedSubview:ex];
    [ex.heightAnchor constraintEqualToConstant:36].active = YES;

    self.panel.hidden = YES;
    [vc.view addSubview:self.panel];
    [self.panel addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dl:)]];
}

- (UIView*)row:(NSString*)t sel:(SEL)sl on:(BOOL)o {
    UIView* r = [UIView new];
    UILabel* l = [UILabel new];
    l.text = t;
    l.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    l.textColor = UIColor.whiteColor;
    l.translatesAutoresizingMaskIntoConstraints = NO;
    [r addSubview:l];
    UISwitch* sw = [UISwitch new];
    sw.on = o;
    sw.onTintColor = UIColor.systemBlueColor;
    sw.transform = CGAffineTransformMakeScale(.78, .78);
    sw.translatesAutoresizingMaskIntoConstraints = NO;
    [sw addTarget:self action:sl forControlEvents:UIControlEventValueChanged];
    [r addSubview:sw];
    [NSLayoutConstraint activateConstraints:@[
        [l.leadingAnchor constraintEqualToAnchor:r.leadingAnchor constant:4],
        [l.centerYAnchor constraintEqualToAnchor:r.centerYAnchor],
        [sw.trailingAnchor constraintEqualToAnchor:r.trailingAnchor constant:-2],
        [sw.centerYAnchor constraintEqualToAnchor:r.centerYAnchor],
        [r.heightAnchor constraintEqualToConstant:32]
    ]];
    return r;
}

- (void)tg { self.panel.hidden = !self.panel.hidden; }

- (void)dg:(UIPanGestureRecognizer*)g {
    CGPoint t = [g translationInView:self];
    self.fab.center = CGPointMake(self.fab.center.x + t.x, self.fab.center.y + t.y);
    [g setTranslation:CGPointZero inView:self];
}

- (void)dl:(UIPanGestureRecognizer*)g {
    CGPoint t = [g translationInView:self];
    self.panel.center = CGPointMake(self.panel.center.x + t.x, self.panel.center.y + t.y);
    [g setTranslation:CGPointZero inView:self];
}

- (void)sG:(UISwitch*)s { eG = s.isOn; }
- (void)sI:(UISwitch*)s { eI = s.isOn; }
- (void)sS:(UISwitch*)s { eS = s.isOn; }
- (void)sB:(UISwitch*)s { eB = s.isOn; }
- (void)sL:(UISwitch*)s { eL = s.isOn; }
- (void)sN:(UISwitch*)s { eN = s.isOn; }
- (void)di:(UISlider*)s {
    mD = s.value;
    UILabel* l = [self.panel viewWithTag:901];
    l.text = [NSString stringWithFormat:@"最大距离 %.0f m", mD];
}

- (void)ex {
    if (G) Scan();
    NSMutableString* out = [NSMutableString string];
    for (CE* e in gC) [out appendFormat:@"%@.%@\n", e.s, e.n];
    NSString* p = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
                   stringByAppendingPathComponent:@"detected.txt"];
    [out writeToFile:p atomically:YES encoding:NSUTF8StringEncoding error:nil];
    UIAlertController* ac = [UIAlertController alertControllerWithTitle:@"已导出"
                                                               message:p
                                                        preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil]];
    [self.rootViewController presentViewController:ac animated:YES completion:nil];
}
@end

static ECV* CV;
static Menu* MN;

static void Boot(void) {
    if (!G) {
        L();
        if (!G) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{ Boot(); });
            return;
        }
    }
    UIWindowScene* scene = AS();
    CGRect b = UIScreen.mainScreen.bounds;

    UIWindow* ew = scene ? [[UIWindow alloc] initWithWindowScene:scene] : [[UIWindow alloc] initWithFrame:b];
    ew.frame = b;
    ew.windowLevel = UIWindowLevelStatusBar + 100;
    ew.backgroundColor = UIColor.clearColor;
    ew.userInteractionEnabled = NO;
    ew.rootViewController = [UIViewController new];
    ew.rootViewController.view.backgroundColor = UIColor.clearColor;
    ew.hidden = NO;

    CV = [[ECV alloc] initWithFrame:b];
    CV.backgroundColor = UIColor.clearColor;
    CV.opaque = NO;
    CV.userInteractionEnabled = NO;
    CV.contentMode = UIViewContentModeRedraw;
    [ew.rootViewController.view addSubview:CV];
    CV.lnk = [CADisplayLink displayLinkWithTarget:CV selector:@selector(tick)];
    [CV.lnk addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];

    MN = scene ? [[Menu alloc] initWithWindowScene:scene] : [[Menu alloc] initWithFrame:b];
    MN.frame = b;
    MN.windowLevel = UIWindowLevelStatusBar + 200;
    [MN build];
    MN.hidden = NO;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{ Scan(); });
    NSLog(@"[G] booted");
}

__attribute__((constructor)) static void init2(void) {
    NSLog(@"[G] dylib loaded");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{ Boot(); });
}
